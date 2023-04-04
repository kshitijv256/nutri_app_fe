import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'requests/Requests.dart';
import 'routes/InputPage.dart';

List items = [];

void main() {
  runApp(const MyApp());
}

var name = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Eat Smart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();

  void changeText() {
    setState(() {
      name = nameController.text;
      debugPrint(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // add image here
              Image.asset('assets/images/img1.jpeg'),
              const Text(
                'Your Name Please!',
                style: TextStyle(
                    fontSize: 28, color: Color.fromARGB(255, 95, 93, 93)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: const Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: TextField(
                  controller: nameController,
                  textAlign: TextAlign.center,
                  onChanged: (text) {
                    changeText();
                  },
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InputPage(name: name)),
                  );
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ));
  }
}
