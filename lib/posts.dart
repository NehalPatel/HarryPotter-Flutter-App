import 'package:flutter/material.dart';

import 'http_service.dart';
import 'post_details.dart';
import 'post_model.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harry Potter Characters"),
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView.separated(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    title: Text(
                      posts[index].name,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        new Flexible(
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              RichText(
                                text: TextSpan(
                                  text: posts[index].actor,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                maxLines: 3,
                                softWrap: true,
                              )
                            ]))
                      ],
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.grey[200]),
                        ),
                      ),
                      child: Hero(
                        tag: "avatar_" + posts[index].name,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(posts[index].image),
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey, size: 30.0),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostDetails(post: posts[index]),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
