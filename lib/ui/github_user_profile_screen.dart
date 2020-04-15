import 'package:flutter/material.dart';
import 'package:fluttergithubapp/bloc/github_bloc.dart';
import 'package:fluttergithubapp/model/user_info_response_model.dart';
import 'package:fluttergithubapp/persistance/repository.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({this.user_Url, Key key}) : super(key: key);
  String user_Url;
  @override
  UserProfileScreenState createState() => UserProfileScreenState(user_Url: user_Url );
}


class UserProfileScreenState extends State<UserProfileScreen> {
  UserProfileScreenState({this.user_Url}) ;
  String user_Url;
  String name = "";
  String Login;
  String avtar_url = "" ;
  String location = "" ;
  int followers = 0 ;
  int followings = 0 ;
  String bio = "" ;
  String updated_at = "" ;
  String followers_url = "" ;
  String followings_url = "" ;
  int public_rposi = 0 ;
  int public_gits = 0 ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      fetchSingleUserInfo(user_Url);
  }

  //Fetch user info
   fetchSingleUserInfo(String _user_url) async {
    Repository _repository = Repository();
    UserInfoResponse userResponse = await _repository.fetchSingleUserInfo(_user_url);
    setState(() {

      if(userResponse.name == null){
        name = userResponse.login;
        print("name is ${name}");
      }
      else{
        name = userResponse.name;
        print("name is ${name}");
      }

      if(userResponse.location == null){
        location = "Not Found";
      }
      else{
        location = userResponse.location;

      }

      if(userResponse.bio == null){
        bio = "Not Found";
      }
      else{
        bio = userResponse.bio ;

      }

      if(userResponse.updated_at == null){
        updated_at = " ";
      }
      else{
        updated_at = userResponse.updated_at ;

      }

      if(userResponse.followers_url == null){
        followers_url = " ";
      }
      else{
        followers_url = userResponse.followers_url ;

      }

      if(userResponse.following_url == null){
        followings_url = " ";
      }
      else{
        followings_url = userResponse.following_url ;

      }
      avtar_url = userResponse.avatar_url;
      followers = userResponse.followers;
      followings = userResponse.following;
      public_rposi = userResponse.public_repos ;
      public_gits = userResponse.public_gists ;

    });

  }


  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(119, 68, 142, 1.0),
        title: Text('Pofile',style: TextStyle(fontFamily: 'BrandingBold', fontSize: 18),),
      ),
      body: Container(
        height: _size.height * 0.6 ,
        child: Card(
          elevation: 6.0,
          margin: EdgeInsets.only(top: 20,left: 10,right: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  color: Color.fromRGBO(250, 250, 250, 1.0),
                  child: Column(
                    children: <Widget>[
                      Container(child: _buildAvtarImage()),
                      Container(
                        child: _buildNameAndLocationSection(),
                        //margin: EdgeInsets.only(bottom: 20),

                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _buildInfoSection(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvtarImage(){
    return Container(
      margin: EdgeInsets.only(top:  20),
      child: CircleAvatar(//shows github user avtar image
        child: ClipOval(
              child: Image.network(avtar_url,)
          ),
        radius: 70,
      ),
    );
  }

  Widget _buildNameAndLocationSection(){
    return Container(
      margin: EdgeInsets.only(top:  10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(name,style: TextStyle(fontFamily: 'BrandingBold', fontSize: 24)),
            ),
          ),
        Container(
          margin: EdgeInsets.only(top:  5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.location_on,size: 18,),
              Text(location,style: TextStyle(fontFamily: 'BrandingLight', fontSize: 12,color: Colors.grey))
            ],
          ),
        ),
          Container(
            margin: EdgeInsets.only(top:  10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('${followers} Followers',style: TextStyle(fontFamily: 'BrandingLight', fontSize: 12)),
                  onPressed: (){
                    print('Followers pressed');
                  },
                ),
                SizedBox(width: 5,),
                Container(height: 10,width: 1,color: Colors.grey,),
                SizedBox(width: 5,),
                FlatButton(
                  child: Text('${followings} Following',style: TextStyle(fontFamily: 'BrandingMedium', fontSize: 12)),
                  onPressed: (){
                    print('Following pressed');
                  },
                )
              ],
            ),
          )

        ],
      ),

    );
  }
  Widget _buildInfoSection(){
    return Container(
      margin: EdgeInsets.only(top:  10),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            child: ListTile(
              title: Text('Bio:') ,
              subtitle:Text(bio) ,
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top:  5),
            child: ListTile(
              title: Text('Public repository:') ,
              subtitle:Text('${public_rposi}') ,
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top:  5),
            child: ListTile(
              title: Text('Public gists:') ,
              subtitle:Text('${public_gits}') ,
            ),
          ),
          Container(
            height: 40,
             margin: EdgeInsets.only(top:  5),
            child: ListTile(
              title: Text('Updated at:') ,
              subtitle:Text(updated_at) ,
            ),
          )

        ],
      ),

    );
  }
}


