import 'package:flutter/material.dart';

class CompanyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Company: Geeksynergy Technologies Pvt Ltd"),
            Text("Address: Sanjayanagar, Bengaluru-56"),
            Text("Phone: XXXXXXXXX09"),
            Text("Email: XXXXXX@gmail.com"),
          ],
        ),
      ),
    );
  }
}
