import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  _fetchMovies() async {
    final url = Uri.parse('https://hoblist.com/api/movieList');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "category": "movies",
        "language": "kannada",
        "genre": "all",
        "sort": "voting"
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _movies = json.decode(response.body)['result'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/company');
            },
          ),
        ],
      ),
      body: _movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  // Votes Column
                  Column(
                    children: [
                      Icon(Icons.arrow_upward),
                      Text(movie['voting'].toString(), // Voting count
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Votes'),
                    ],
                  ),
                  SizedBox(width: 10),
                  // Movie Poster
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      movie['poster'],
                      width: 80,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.movie),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Movie Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['title'], // Movie title
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Genre: ${movie['genre']}'),
                        Text('Director: ${movie['director']}'),
                        Text('Starring: ${movie['stars']}'),
                        Text('Mins | ${movie['language']} | ${movie['releasedDate']}'),
                        SizedBox(height: 8),
                        Text('${movie['views']} views | Voted by ${movie['voting']} people'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
