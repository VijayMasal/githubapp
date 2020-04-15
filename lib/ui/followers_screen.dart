import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergithubapp/bloc/github_bloc.dart';
import 'package:fluttergithubapp/model/followers_response_model.dart';

class FollowersScreen extends StatefulWidget {

  FollowersScreen({this.user_Url,this.name, Key key}) : super(key: key);
  String user_Url;
  String name;
  @override
  FollowersScreenState createState() => FollowersScreenState(user_Url: user_Url,name: name);
}


class FollowersScreenState extends State<FollowersScreen> {
  FollowersScreenState({this.user_Url,this.name}) ;
  String user_Url;
  String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("user_Url ${user_Url}");
    githubBloc.fetchFollowerItems(user_Url);
  }

  @override
  Widget build(BuildContext context) {
    //githubBloc.fetchFollowerItems(user_Url);
    return Scaffold(
      body: StreamBuilder(
          stream: githubBloc.followerItems,
          builder: (context, AsyncSnapshot<FollowersResponse> snapshot) {
            if (snapshot.hasData) {
              return _buildListView(snapshot.data);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildGithubUserScreen() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          //loads search bar
          _buildTabBar(),
          Expanded(//loads github user list
              child: StreamBuilder(
                  stream: githubBloc.followerItems,
                  builder: (context, AsyncSnapshot<FollowersResponse> snapshot) {
                    if (snapshot.hasData) {
                      return _buildListView(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  })
          ),
        ],
      ),
    );
  }


  //ListView container shows serched user login, id, score, and avtar image
  Widget _buildListView(FollowersResponse data){
    return  ListView.separated(
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        var _size = MediaQuery.of(context).size;
        return ListTile(//Inside list title shows github user list
          title: Text(//shows github user login
              data.items[index].login,
              style: TextStyle(fontFamily: 'BrandingSemiBold', fontSize: 18)
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text(//shows github user id
                    'Id:${data.items[index].id}',
                    style: TextStyle(fontFamily: 'BrandingLight', fontSize: 14),

                  )
              ),
              SizedBox(width: _size.width * 0.1,),
            ],
          ),
          leading: CircleAvatar(//shows github user avtar image
              child: ClipOval(
                  child: Image.network(data.items[index].avatar_url)
              )
          ),
          onTap: (){

//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => UserProfileScreen(user_Url:data.items[index].url ,)),
//            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildTabBar(){
    return Container(
      height: 80,
      child: TabBar(
       tabs: <Widget>[
         new Tab(
           icon: const Icon(Icons.home),
           text: 'Address',
         ),
         new Tab(
           icon: const Icon(Icons.my_location),
           text: 'Location',
         ),
       ],
      ),

    );
  }


}
