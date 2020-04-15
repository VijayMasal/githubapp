
import 'dart:convert';
import 'package:fluttergithubapp/model/github_response_model.dart';
import 'package:http/http.dart';

class ApiProvider{
  Client client = Client();
//  final _baseURL = "https://api.github.com/search/users?q=torvalds&page=1";
  Future<GitHubResponse> fetchUserItems(String name) async {
    final _baseURL = "https://api.github.com/search/users?q=${name}&page=1";
    final response = await client.get("$_baseURL");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GitHubResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}