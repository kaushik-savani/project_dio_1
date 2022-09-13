import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class DummyQuotes extends StatefulWidget {
  const DummyQuotes({Key? key}) : super(key: key);

  @override
  State<DummyQuotes> createState() => _DummyQuotesState();
}

class _DummyQuotesState extends State<DummyQuotes> {
  Map<String, dynamic> m = {};
  bool status = false;
  dummy? d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/quotes');
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
            title: Text("Dummy Quotes"),
          ),
          body: status
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: d!.quotes!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text("${d!.quotes![index].id}"),
                  title: Text("${d!.quotes![index].author}"),
                  subtitle: Text("${d!.quotes![index].quote}"),
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
  List<Quotes>? quotes;
  int? total;
  int? skip;
  int? limit;

  dummy({this.quotes, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(new Quotes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
