import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_service/ApiController.dart';
import '../models/Repository.dart';
import 'DetailsPage.dart';
class HomePage extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositories'),
      ),
      body: Obx(
            () => apiController.repositories.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: apiController.repositories.length,
          itemBuilder: (context, index) {
            if (index == apiController.repositories.length - 1) {
              // Load more repositories when reaching the end of the list
              apiController.loadMoreRepositories();
            }
            final Repository repository = apiController.repositories[index];
            return ListTile(
              title: Text(repository.fullName),
              subtitle: Text(repository.description ?? 'No description'),
              onTap: () {
                Get.to(DetailsPage(repository));
              },
            );
          },
        ),
      ),
    );
  }
}
