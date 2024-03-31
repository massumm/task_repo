import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Constant.dart';
import '../api_service/ApiController.dart';
import '../models/Repository.dart';
class DetailsPage extends StatelessWidget {
  final Repository repository;

  DetailsPage(this.repository);



  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Details'),
      ),
      body: FutureBuilder(
        future: fetchOwnerDetails(repository.owner),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final ownerDetails = snapshot.data as Map<String, dynamic>;
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Owner: ${ownerDetails['name'] ?? 'Unknown'}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    CircleAvatar(
                      backgroundImage: NetworkImage(ownerDetails['avatar_url'] ?? ''),
                      radius: 40.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Description: ${repository.description ?? "No description"}',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Last Updated: ${formatDate(ownerDetails['updated_at'] ?? '')}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
