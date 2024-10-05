import 'package:flutter/material.dart';

import 'user_detail_page.dart'; // Import the detail page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  bool isGridView = false;
  String searchQuery = '';

  // Mock data for users
  final List<Map<String, String>> users = [
    {'id': '1', 'title': 'Mr', 'firstName': 'John', 'lastName': 'Doe', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '2', 'title': 'Ms', 'firstName': 'Jane', 'lastName': 'Doe', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '3', 'title': 'Mr', 'firstName': 'Steve', 'lastName': 'Smith', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '4', 'title': 'Mrs', 'firstName': 'Anna', 'lastName': 'Johnson', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '5', 'title': 'Mr', 'firstName': 'Robert', 'lastName': 'Brown', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '6', 'title': 'Ms', 'firstName': 'Emily', 'lastName': 'Davis', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '7', 'title': 'Mr', 'firstName': 'Michael', 'lastName': 'Wilson', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '8', 'title': 'Ms', 'firstName': 'Sarah', 'lastName': 'Taylor', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '9', 'title': 'Mr', 'firstName': 'David', 'lastName': 'Anderson', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
    {'id': '10', 'title': 'Ms', 'firstName': 'Sophia', 'lastName': 'Thomas', 'picture': 'https://image.cnbcfm.com/api/v1/image/107168566-1671481983597-gettyimages-1450398458-mj1_4451_ce4b38b2-9f26-404e-b214-cf8454d82d0f.jpeg?v=1671482283&w=1858&h=1045&vtcrop=y'},
  ];


  // Filter users based on the search query
  List<Map<String, String>> get filteredUsers {
    if (searchQuery.isEmpty) {
      return users;
    } else {
      return users.where((user) {
        final fullName = '${user['firstName']} ${user['lastName']}';
        return fullName.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          // Toggle between list view and grid view
          Switch(
            value: isGridView,
            onChanged: (value) {
              setState(() {
                isGridView = value;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Users',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: isGridView ? buildGridView() : buildListView(),
          ),
        ],
      ),
    );
  }

  // Build List View
  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        final user = filteredUsers[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user['picture']!),
          ),
          title: Text('${user['firstName']} ${user['lastName']}'),
          subtitle: Text('ID: ${user['id']} - Title: ${user['title']}'),
          onTap: () {
            // Navigate to the detailed view
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailPage(user: user),
              ),
            );
          },
        );
      },
    );
  }

  // Build Grid View
  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        final user = filteredUsers[index];
        return InkWell(
          onTap: () {
            // Navigate to the detailed view
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailPage(user: user),
              ),
            );
          },
          child: GridTile(
            footer: Center(
              child: Text('${user['firstName']} ${user['lastName']}'),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user['picture']!),
                ),
                Text('ID: ${user['id']}'),
                Text('Title: ${user['title']}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
