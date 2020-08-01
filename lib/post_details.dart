import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'http_service.dart';
import 'post_model.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  final HttpService httpservice = HttpService();

  PostDetails({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post Details"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Title"),
                    subtitle: Text(post.name),
                  ),
                  ListTile(
                    title: Text("ID"),
                    subtitle: Text(post.name),
                  ),
                  ListTile(
                    title: Text("Body"),
                    subtitle: Text(post.gender.toString()),
                  ),
                  ListTile(
                    title: Text("User ID"),
                    subtitle: Text(post.actor),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
