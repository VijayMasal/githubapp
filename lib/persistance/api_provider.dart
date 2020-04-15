
import 'dart:convert';
import 'package:fluttergithubapp/model/followers_response_model.dart';
import 'package:fluttergithubapp/model/github_response_model.dart';
import 'package:fluttergithubapp/model/user_info_response_model.dart';
import 'package:http/http.dart';

class ApiProvider{
  Client client = Client();
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


  Future<UserInfoResponse> fetchSingleUserInfo(String _user_url) async {
    final response = await client.get("$_user_url");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return UserInfoResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<FollowersResponse> fetchFollowers(String _user_url) async {
    final response = await client.get("$_user_url");
    print(response.body.toString());

    if (response.statusCode == 200) {
      //return UserInfoResponse.fromJson(json.decode(response.body));
      return FollowersResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}