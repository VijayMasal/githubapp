//UserItems model is used for user items from github user api
class Followers{
  String _login;
  int _id;
  String _avatar_url;

  Followers(parsedJson){
    _login = parsedJson['login'];
    _id = parsedJson['id'];
    _avatar_url = parsedJson['avatar_url'];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get login => _login;

  set description(String value) {
    _login = value;
  }


  String get avatar_url => _avatar_url;

  set avatar_url(String value) {
    _avatar_url = value;
  }

}