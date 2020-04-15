import 'package:flutter/material.dart';
import 'package:fluttergithubapp/ui/followers_screen.dart';


class TabBarScreen extends StatefulWidget {
  TabBarScreen({this.followers_url,this.following_url,this.name, Key key}) : super(key: key);
  String followers_url;
  String following_url;
  String name;
  @override
  TabBarScreenState createState() => TabBarScreenState(followers_url: followers_url,following_url: following_url,name: name);
}


class TabBarScreenState extends State<TabBarScreen> with
    TickerProviderStateMixin {
  TabBarScreenState({this.followers_url,this.following_url,this.name}) ;
  String followers_url;
  String following_url;
  String name;
  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _tabController = new TabController(vsync: this, length:2);
    }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(119, 68, 142, 1.0),
        title: Text(name,style: TextStyle(fontFamily: 'BrandingBold', fontSize: 24),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color.fromRGBO(119, 68, 142, 1.0),
                tabs: <Widget>[
                  Text('Followers',style: TextStyle(fontFamily: 'BrandingLight', fontSize: 14,color: Colors.black)),
                  Text('Followings',style: TextStyle(fontFamily: 'BrandingLight', fontSize: 14,color: Colors.black))
                ],

              ),
            ),
            Expanded(

              child: Container(
                child:TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    FollowersScreen(followers_url:followers_url,following_url: following_url,name:name ,isFollows: true,),
                    FollowersScreen(followers_url: followers_url,following_url: following_url,name:name,isFollows: false ,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );

  }
}