import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class Dummy_Products1 extends StatefulWidget {
  const Dummy_Products1({Key? key}) : super(key: key);

  @override
  State<Dummy_Products1> createState() => _Dummy_Products1State();
}

class _Dummy_Products1State extends State<Dummy_Products1> {
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
      var response = await Dio().get('https://dummyjson.com/products/1');
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
            title: Text("Dummy Products 1"),
          ),
          body: status
              ? Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Text("${d!.id}"),
                    title: Text("${d!.title}"),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "description : ${d!.description}",
                          ),
                          Text(
                            "price : ${d!.price}",
                          ),
                          Text(
                            "discountPercentage : ${d!.discountPercentage}",
                          ),
                          Text(
                            "rating : ${d!.rating}",
                          ),
                          Text(
                            "stock : ${d!.stock}",
                          ),
                          Text(
                            "brand : ${d!.brand}",
                          ),
                          Text(
                            "category : ${d!.category}",
                          ),
                          Text(
                            "thumbnail : ${d!.thumbnail}",
                          ),
                          Text("images :"),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: d!.images!.length,
                            itemBuilder: (context, index) {
                              return Text("  ${d!.images![index]}");
                            },
                          )
                        ]),
                  ),
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
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  dummy(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  dummy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
