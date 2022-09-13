import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dio_1/main.dart';

class Dummy_products extends StatefulWidget {
  const Dummy_products({Key? key}) : super(key: key);

  @override
  State<Dummy_products> createState() => _Dummy_productsState();
}

class _Dummy_productsState extends State<Dummy_products> {
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
      var response = await Dio().get('https://dummyjson.com/products');
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
            title: Text("Dummy - Products"),
          ),
          body: status
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: d!.products!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: Text("${d!.products![index].id}"),
                  title: Text("${d!.products![index].title}"),
                  subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "description : ${d!.products![index].description}",
                        ),
                        Text(
                          "price : ${d!.products![index].price}",
                        ),
                        Text(
                          "discountPercentage : ${d!.products![index].discountPercentage}",
                        ),
                        Text(
                          "rating : ${d!.products![index].rating}",
                        ),
                        Text(
                          "stock : ${d!.products![index].stock}",
                        ),
                        Text(
                          "brand : ${d!.products![index].brand}",
                        ),
                        Text(
                          "category : ${d!.products![index].category}",
                        ),
                        Text(
                          "thumbnail : ${d!.products![index].thumbnail}",
                        ),
                        Text("images :"),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount:
                          d!.products![index].images!.length,
                          itemBuilder: (context, index1) {
                            return Text(
                                "  ${d!.products![index].images![index1]}");
                          },
                        )
                      ]),
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
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  dummy({this.products, this.total, this.skip, this.limit});

  dummy.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = double.parse(json['rating'].toString());
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
