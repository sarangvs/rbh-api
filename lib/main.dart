import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rbh_api/second_screen.dart';
import 'package:rbh_api/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController teamBackgroundController = TextEditingController();
  TextEditingController companyProductController = TextEditingController();
  TextEditingController incubationTypeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  Future<User?> postData(
      String name,
      String address,
      String city,
      String state,
      String email,
      String phone,
      String companyName,
      String teamBackground,
      String companyProduct,
      String incubationType,
      String status) async {
    var uri = Uri.parse('https://rbhform.herokuapp.com/api/form-details/?format=json');
    var response = await http.post(uri, body:{
      "name": name,
      "address": address,
      "city": city,
      "state": state,
      "email": email,
      "phone": phone,
      "company_name": companyName,
      "team_background": teamBackground,
      "company_products": companyProduct,
      "incubation_type": incubationType,
      "status": status
    });
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 200) {
      final dynamic responseString = jsonDecode(response.body);

      return User.fromJson(responseString);
    } else {
      throw Exception('Something Went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(),));
              }, 
              icon: const Icon(Icons.add,color: Colors.white,)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Name',
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: nameController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Address',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: addressController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'City',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: cityController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'State',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: stateController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Phone',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: phoneController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Company Name',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: companyNameController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Team Background',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: teamBackgroundController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Company Products',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: companyProductController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Incubation Type',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: incubationTypeController,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'status',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(13),
                            gapPadding: 5,
                          ),
                          fillColor: const Color(0xffe8e7e3),
                          filled: true),
                      controller: statusController,
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      var name = nameController.text;
                      var address = addressController.text;
                      var city = cityController.text;
                      var state = stateController.text;
                      var email = emailController.text;
                      var phone = phoneController.text;
                      var companyName = companyNameController.text;
                      var teamBackground = teamBackgroundController.text;
                      var companyProduct = companyProductController.text;
                      var incubationType = incubationTypeController.text;
                      var status = statusController.text;

                      final user = await postData(
                          name,
                          address,
                          city,
                          state,
                          email,
                          phone,
                          companyName,
                          teamBackground,
                          companyProduct,
                          incubationType,
                          status);
                      print(user!.name);
                    },
                    child: Container(
                      height: 20,
                      width: 400,
                      child: const Center(
                        child: Text('Done'),
                      ),
                      color: Colors.redAccent,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}