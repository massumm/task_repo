import 'package:flutter/material.dart';
import '../models/Repository.dart';

class DetailsPage extends StatelessWidget {
  final Repository repository;
  DetailsPage(this.repository);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Owner: ${repository.owner}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            CircleAvatar(
              backgroundImage: NetworkImage(repository.avatarUrl.toString()),
              radius: 40.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: ${repository.description ?? "No description"}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            // Text(
            //   'Last Updated: ${DateFormat('MM-dd-yyyy HH:mm').format(repository.lastUpdateTime)}',
            //   style: TextStyle(fontSize: 16.0),
            // ),
          ],
        ),
      ),
    );
  }
}
