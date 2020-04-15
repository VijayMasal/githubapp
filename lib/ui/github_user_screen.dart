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

  //Github user screen contains search bar and user listview
  Widget _buildGithubUserScreen() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          //loads search bar
          _buildSearchBar(),
          Expanded(//loads github user list
              child: StreamBuilder(
                  stream: githubBloc.items,
                  builder: (context, AsyncSnapshot<GitHubResponse> snapshot) {
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

  //Search bar container
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
                  //fetch github users as per search value
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

  //ListView container shows serched user login, id, score, and avtar image
  Widget _buildListView(GitHubResponse data){
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
            Container(// shows github user score

                child: Text('Score${data.items[index].score}')
            ),
            SizedBox(width: _size.width * 0.1,),
          ],
        ),
        leading: CircleAvatar(//shows github user avtar image
            child: ClipOval(
                child: Image.network(data.items[index].avatar_url)
            )
        ),
        trailing:Icon(
          Icons.arrow_forward_ios
        ),
        onTap: (){
          print("Url is =${data.items[index].url}");
        },
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
  }

  //clear search text
  onSearchTextChanged(String text) async {
    if (controller.text.isEmpty) {
      setState(() {});
      return;
    }

  }
}
