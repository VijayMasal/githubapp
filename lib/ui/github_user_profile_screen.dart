import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({this.user_Url, Key key}) : super(key: key);
  String user_Url;
  @override
  UserProfileScreenState createState() => UserProfileScreenState(user_Url: user_Url );
}


class UserProfileScreenState extends State<UserProfileScreen> {
  UserProfileScreenState({this.user_Url}) ;
  String user_Url;
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user_Url),
      ),
    );
  }
}
