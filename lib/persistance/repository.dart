
/*This Repository class mediates between the domain and the data mapping layers,
acting like an in-memory domain object collection.
Maybe you are familiar with this class if you interacted with other programming languages.
 */

import 'package:fluttergithubapp/model/github_response_model.dart';
import 'package:fluttergithubapp/persistance/api_provider.dart';

class Repository{
  ApiProvider appApiProvider = ApiProvider();
  Future<GitHubResponse> fetchUserItems(String name) => appApiProvider.fetchUserItems(name);
}