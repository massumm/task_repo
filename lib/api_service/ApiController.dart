import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Repository.dart';
class ApiController extends GetxController {
  var repositories = <Repository>[].obs;
  var currentPage = 1;
  @override
  void onInit() {
    fetchRepositories();
    super.onInit();
  }
  Future<void> fetchRepositories() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/repositories?page=$currentPage&per_page=10'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        List<Repository> fetchedRepositories = responseData
            .map((json) => Repository(
          id: json['id'],
          name: json['name'],
          fullName: json['full_name'],
          description: json['description'],
          owner: json['owner']['login'],
          avatarUrl: json['owner']['avatar_url'],

        ))
            .toList();
        repositories.addAll(fetchedRepositories);
        print("Fetched repositories: ${fetchedRepositories.length}");
      } else {
        print("Failed to fetch repositories: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching repositories: $e");
    }
  }
  void loadMoreRepositories() {
    currentPage++;
    fetchRepositories();
  }
}
