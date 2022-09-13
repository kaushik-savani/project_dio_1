import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class DummyPosts extends StatefulWidget {
  const DummyPosts({Key? key}) : super(key: key);

  @override
  State<DummyPosts> createState() => _DummyPostsState();
}

class _DummyPostsState extends State<DummyPosts> {
  Map<String, dynamic> m = {};
  dummy? d;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/posts');
      print(response);
      m = response.data;
      d = dummy.fromJson(m);
      setState(() {
        status = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Dummy Posts"),
          ),
          body: status
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: d!.posts!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text("${d!.posts![index].id}"),
                  title: Text("${d!.posts![index].title}"),
                  subtitle: Column(
                    children: [
                      Text("body :${d!.posts![index].body}"),
                      Text("userId :${d!.posts![index].userId}"),
                      Text("Tags :"),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: d!.posts![index].tags!.length,
                        itemBuilder: (context, index1) {
                          return Text(
                              "  ${d!.posts![index].tags![index1]}");
                        },
                      ),
                      Text(
                          "reactions :${d!.posts![index].reactions}")
                    ],
                  ),
                ),
              );
            },
          )
              : Center(child: CircularProgressIndicator()),
        ),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return demo();
      },
    ));
    return Future.value();
  }
}

class dummy {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  dummy({this.posts, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Posts {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  Posts(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['tags'] = this.tags;
    data['reactions'] = this.reactions;
    return data;
  }
}
