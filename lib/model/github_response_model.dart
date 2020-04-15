
import 'package:fluttergithubapp/model/user_items_model.dart';

class GitHubResponse{
  int _total_count;
  bool _incomplete_results;
  List<UserItem> _items;

  GitHubResponse.fromJson(Map<String, dynamic> parsedJson) {
    _total_count = parsedJson['total_count'];
    _incomplete_results = parsedJson['incomplete_results'];
    List<UserItem> items = [];
    for (int i = 0; i < parsedJson['items'].length; i++) {
      UserItem result = UserItem(parsedJson['items'][i]);
      items.add(result);
    }
    _items = items;

  }

  List<UserItem> get items => _items;

  set items(List<UserItem> value) {
    _items = value;
  }

  bool get incomplete_results => _incomplete_results;

  set incomplete_results(bool value) {
    _incomplete_results = value;
  }



  int get total_count => _total_count;

  set total_count(int value) {
    _total_count = value;
  }


}