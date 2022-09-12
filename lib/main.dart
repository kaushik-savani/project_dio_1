import 'package:flutter/material.dart';
import 'package:project_dio_1/DioAlbums.dart';
import 'package:project_dio_1/DioComments.dart';
import 'package:project_dio_1/DioPhotos.dart';
import 'package:project_dio_1/DioPosts.dart';
import 'package:project_dio_1/DioTodos.dart';
import 'package:project_dio_1/DioUsers.dart';
import 'package:project_dio_1/Dio_Comments_Postid.dart';
import 'package:project_dio_1/Dio_Post1.dart';
import 'package:project_dio_1/Dio_Posts.dart';
import 'package:project_dio_1/Dio_Posts1_Comments.dart';
import 'package:project_dio_1/DummyCarts.dart';
import 'package:project_dio_1/DummyComments.dart';
import 'package:project_dio_1/DummyPosts.dart';
import 'package:project_dio_1/DummyProducts.dart';
import 'package:project_dio_1/DummyQuotes.dart';
import 'package:project_dio_1/DummyTodos.dart';
import 'package:project_dio_1/DummyUsers.dart';
import 'package:project_dio_1/Dummy_C.dart';
import 'package:project_dio_1/Dummy_C_Smartphone.dart';
import 'package:project_dio_1/Dummy_Laptops.dart';
import 'package:project_dio_1/Dummy_Products.dart';
import 'package:project_dio_1/Dummy_products1.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jsonplaceholder")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioPosts();
                    },
                  ));
                },
                child: Text("Posts")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioComments();
                    },
                  ));
                },
                child: Text("Comments")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioAlbums();
                    },
                  ));
                },
                child: Text("Albums")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioPhotos();
                    },
                  ));
                },
                child: Text("Photos")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioTodos();
                    },
                  ));
                },
                child: Text("Todos")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DioUsers();
                    },
                  ));
                },
                child: Text("Users")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dio_Post();
                    },
                  ));
                },
                child: Text("Post")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dio_Post1();
                    },
                  ));
                },
                child: Text("Post/1")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dio_Posts1_Comments();
                    },
                  ));
                },
                child: Text("posts/1/comments")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dio_Comments_Postid();
                    },
                  ));
                },
                child: Text("comments?postId=1")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyProducts();
                    },
                  ));
                },
                child: Text("DummyProducts")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyCarts();
                    },
                  ));
                },
                child: Text("DummyCarts")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyUsers();
                    },
                  ));
                },
                child: Text("DummyUsers")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyPosts();
                    },
                  ));
                },
                child: Text("DummyPosts")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyComments();
                    },
                  ));
                },
                child: Text("DummyComments")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyQuotes();
                    },
                  ));
                },
                child: Text("DummyQuotes")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return DummyTodos();
                    },
                  ));
                },
                child: Text("DummyTodos")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dummy_products();
                    },
                  ));
                },
                child: Text("Dummy_products")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dummy_Products1();
                    },
                  ));
                },
                child: Text("Dummy_products_1")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dummy_Laptops();
                    },
                  ));
                },
                child: Text("Dummy_Laptops")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dummy_C();
                    },
                  ));
                },
                child: Text("Dummy_Categories")),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Dummy_C_Smartphone();
                    },
                  ));
                },
                child: Text("Dummy_C_Smartphone")),
          ],
        ),
      ),
    );
  }
}
