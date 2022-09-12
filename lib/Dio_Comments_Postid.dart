import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class Dio_Comments_Postid extends StatefulWidget {
  const Dio_Comments_Postid({Key? key}) : super(key: key);

  @override
  State<Dio_Comments_Postid> createState() => _Dio_Comments_PostidState();
}

class _Dio_Comments_PostidState extends State<Dio_Comments_Postid> {
  List l = [];
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response = await Dio()
          .get('https://jsonplaceholder.typicode.com/comments?postId=1');
      print(response);
      l = response.data;
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
            title: Text("Dio Comments Postid"),
          ),
          body: status
              ? ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (context, index) {
                    model m = model.fromJson(l[index]);
                    return Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "userId :${m.postId}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "id :${m.id}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "name :${m.name}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "email :${m.email}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "body :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${m.body}",
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
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

class model {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  model({this.postId, this.id, this.name, this.email, this.body});

  model.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
