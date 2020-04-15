import 'package:flutter/material.dart';
import 'package:fluttergithubapp/bloc/github_bloc.dart';
import 'package:fluttergithubapp/ui/github_user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(119, 68, 142, 1.0),
        title: Text('GitHub',style: TextStyle(fontFamily: 'BrandingBold', fontSize: 24),),
      ),
      body: GitHubUserScreen(),
    );
  }
}
