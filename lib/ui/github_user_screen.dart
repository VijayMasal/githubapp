import 'package:flutter/material.dart';
import 'package:fluttergithubapp/bloc/github_bloc.dart';
import 'package:fluttergithubapp/model/github_response_model.dart';

class GitHubUserScreen extends StatefulWidget {
  @override
  GitHubUserScreenState createState() => GitHubUserScreenState();
}


class GitHubUserScreenState extends State<GitHubUserScreen> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {


  return _buildGithubUserScreen();
  }

  Widget _buildListView(GitHubResponse data){

  return  ListView.separated(
    itemCount: data.items.length,
    itemBuilder: (context, index) {
      var _size = MediaQuery.of(context).size;
      return ListTile(
        title: Text(data.items[index].login),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Text('Id:${data.items[index].id}')
            ),


            Container(

                child: Text('Score${data.items[index].score}')
            ),

            SizedBox(width: _size.width * 0.1,),
          ],
        ),
        leading: CircleAvatar(
            child: ClipOval(
                child: Image.network(data.items[index].avatar_url)
            )
        ),
        trailing:Icon(
          Icons.arrow_forward_ios
        ),
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
  }

  Widget _buildGithubUserScreen() {


    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildSearchBar(),
          Expanded(
          child: StreamBuilder(
        stream: githubBloc.items,
        builder: (context, AsyncSnapshot<GitHubResponse> snapshot) {
          if (snapshot.hasData) {
            //return _buildGithubUserScreen(snapshot.data);
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

  Widget _buildSearchBar() {
    return new Container(
      color: Color.fromRGBO(119, 68, 142, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
              controller: controller,
              decoration: new InputDecoration(
                  hintText: 'Search', border: InputBorder.none),
              onChanged: (value) {
               if (value != "") {
                 githubBloc.fetchUserItems(value);
               }


              },
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel), onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },),
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
   githubBloc.dispose();
    if (controller.text.isEmpty) {
      setState(() {});
      return;
    }

  }
}
