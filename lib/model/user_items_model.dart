//UserItems model is used for user items from github user api
class UserItem{
  String _login;
  int _id;
  double _score;
  String _avatar_url;
  String _url;

  UserItem(parsedJson){
    _login = parsedJson['login'];
    _id = parsedJson['id'];
    _score = parsedJson['score'];
    _avatar_url = parsedJson['avatar_url'];
    _url = parsedJson['url'];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  double get score => _score;

  set score(double value) {
    _score = value;
  }

  String get login => _login;

  set description(String value) {
    _login = value;
  }


  String get avatar_url => _avatar_url;

  set avatar_url(String value) {
    _avatar_url = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }
}