import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rbh_api/user_model.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Future<User> futureUser;

  var jsonData = [];

  @override
  void initState() {
    super.initState();
    futureUser = getData().whenComplete(() async{
      final user = await getData();
      print(user.id);
    });
  }

  Future<User> getData() async {
    final response = await http.get(Uri.parse('https://rbhform.herokuapp.com/api/status'));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> responseRequest = jsonDecode(response.body);

      for(int i = 0; i< responseRequest.length; i++){
        print(responseRequest[i]['name']);
      }

      return User.fromJson(responseRequest[0]);
    } else {
      throw Exception('Faileddd');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Second Screen'),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: SizedBox(
      //       height: screenHeight,
      //       width: screenWidth,
      //       child: Column(
      //         children: [
      //           ListView.separated(
      //             itemBuilder: (context, index) {
      //               return const ListTile(
      //                 title: Text('Name'),
      //                 subtitle: Text('Address'),
      //               );
      //             },
      //             itemCount: 2,
      //             separatorBuilder: (BuildContext context, int index) {
      //               return const SizedBox(
      //                 height: 10,
      //               );
      //             },
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
