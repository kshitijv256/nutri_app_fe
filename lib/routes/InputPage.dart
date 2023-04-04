import 'package:eat_smart/requests/Requests.dart';
import 'package:eat_smart/routes/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../main.dart';

var query = "";

class InputPage extends StatefulWidget {
  InputPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  var name;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController queryController = TextEditingController();

  void changeQuery() {
    setState(() {
      query = queryController.text;
      debugPrint(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/img2.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Namaste,",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.name} 🙏',
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: queryController,
              onChanged: (text) {
                setState(() {
                  query = queryController.text;
                  debugPrint(query);
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search for a food item',
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(query: query)),
                );
              },
              child: const Text(
                "Search",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
