

class UserInfoResponse {
  double _lon;
  double _lat;
  String _name;
  String _avatar_url;
  String _followers_url;
  String _following_url;
  String _bio;
  String _location;
  String _updated_at;
  int _public_repos;
  int _public_gists;
  int _followers;
  int _following;

  UserInfoResponse.fromJson(Map<String, dynamic> parsedJson) {
    _name = parsedJson['name'];
    _avatar_url = parsedJson['avatar_url'];
    _followers_url = parsedJson['followers_url'];
    _following_url = parsedJson['following_url'];
    _bio = parsedJson['bio'];
    _location = parsedJson['location'];
    _updated_at = parsedJson['updated_at'];
    _public_repos = parsedJson['public_repos'];
    _public_gists = parsedJson['public_gists'];
    _followers = parsedJson['followers'];
    _following = parsedJson['following'];

  }



  String get name => _name;

  set name(String value) {
    _name = value;
  }


  String get avatar_url => _avatar_url;

  set avatar_url(String value) {
    _avatar_url = value;
  }

  String get followers_url => _followers_url;

  set followers_url(String value) {
    _followers_url = value;
  }


  String get following_url => _following_url;

  set following_url(String value) {
    _following_url = value;
  }


  String get bio => _bio;

  set bio(String value) {
    _bio = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }


  int get public_repos => _public_repos;

  set public_repos(int value) {
    _public_repos = value;
  }

  int get public_gists => _public_gists;

  set public_gists(int value) {
    _public_gists = value;
  }

  int get followers => _followers;

  set followers(int value) {
    _followers = value;
  }


  int get following => _following;

  set following(int value) {
    _following = value;
  }


}


