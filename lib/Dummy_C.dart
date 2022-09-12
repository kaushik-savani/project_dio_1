import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class Dummy_C extends StatefulWidget {
  const Dummy_C({Key? key}) : super(key: key);

  @override
  State<Dummy_C> createState() => _Dummy_CState();
}

class _Dummy_CState extends State<Dummy_C> {
  bool status = false;
  List l = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response =
          await Dio().get('https://dummyjson.com/products/categories');
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
            title: Text("Dummy categories"),
          ),
          body: status
              ? ListView.builder(
                  itemCount: l.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${l[index]}"),
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
