import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences';
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String? email = "";
  String? password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Shared Preferences')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)))),
          
          const Padding(padding: EdgeInsets.only(top: 4)),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)))),

          ElevatedButton(
            child: const Text("Set"),
            onPressed: () {
              setIntoSharedPreferences();
            },
          ),

          const Padding(padding: EdgeInsets.only(top: 8)),

          Text(
            "Your Email : $email",
            style: const TextStyle(fontSize: 20),
          ),

          Text(
            "Your Password : $password",
            style: const TextStyle(fontSize: 20),
          ),

          ElevatedButton(
            child: const Text("Get"),
            onPressed: () {
              getFromSharedPreferences();
            },
          ),
        ],
      ),
    );
  }

  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController);
  }

  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString("email");
      password = prefs.getString("password");
    });
  }
}
