import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class Dio_Post extends StatefulWidget {
  const Dio_Post({Key? key}) : super(key: key);

  @override
  State<Dio_Post> createState() => _Dio_PostState();
}

class _Dio_PostState extends State<Dio_Post> {
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
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
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
            title: Text("Dio Posts"),
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
                              "userId :${m.userId}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "id :${m.id}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "title :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${m.title}"),
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
  int? userId;
  int? id;
  String? title;
  String? body;

  model({this.userId, this.id, this.title, this.body});

  model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
