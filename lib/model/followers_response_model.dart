
import 'package:fluttergithubapp/model/followers_model.dart';
import 'package:fluttergithubapp/model/user_items_model.dart';

class FollowersResponse{

  List<Followers> _followersItems;
  FollowersResponse.fromJson(List<dynamic> parsedJson) {
    List<Followers> items = [];
    for (int i = 0; i < parsedJson.length; i++) {
    Followers followers = Followers(parsedJson[i]);
    items.add(followers);
    }
    _followersItems = items;

  }

  List<Followers> get items => _followersItems;

  set items(List<Followers> value) {
    _followersItems = value;
  }




}