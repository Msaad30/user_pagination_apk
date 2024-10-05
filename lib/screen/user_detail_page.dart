import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, String> user;

  const UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user['firstName']} ${user['lastName']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user['picture']!),
              ),
            ),
            SizedBox(height: 16),
            Text('ID: ${user['id']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Title: ${user['title']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('First Name: ${user['firstName']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Last Name: ${user['lastName']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            // Add more fields or user-specific details if available
          ],
        ),
      ),
    );
  }
}
