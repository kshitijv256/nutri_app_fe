import 'package:eat_smart/main.dart';
import 'package:eat_smart/requests/Requests.dart';
import 'package:eat_smart/routes/InputPage.dart';
import 'package:flutter/material.dart';

Future<List> request(String query) async {
  query = query.toUpperCase();
  List temp = await fetchData(query);
  items = temp;
  return items;
}

class ResultsPage extends StatefulWidget {
  ResultsPage({
    Key? key,
    required this.query,
  }) : super(key: key);

  var query;
  var count;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: request(query),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // return Center(
            //   child: Text(items[0].toString() + "\n" + items[1].toString()),
            // );
            return Scaffold(
              appBar: AppBar(
                title: const Text('Results'),
                backgroundColor: Colors.green,
              ),
              body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      decoration: index == 0
                          ? BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: Container(
                        // padding: const EdgeInsets.all(4.0),
                        color: index == 0
                            ? Color.fromARGB(255, 254, 250, 237)
                            : Colors.white,
                        child: ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                index == 0
                                    ? Positioned(
                                        left: 4,
                                        top: 4,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.workspace_premium,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              "Best Choice",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                Text(
                                  items[index].details,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 43, 113, 73),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Divider(
                                color: Colors.green[400],
                                thickness: 1,
                              ),
                            ),
                            index == 0
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Energy: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].energy.toString() + " kcal",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Protein: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].protien.toString() + " g",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Sugar: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].sugar.toString() + " g",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Cholesterol: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].cholesterol.toString() + " mg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Carbohydrates: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].carbs.toString() + " g",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Total Fat: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].totalFat.toString() + " g",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Fibers: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].fiber.toString() + " g",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Divider(
                                color: Colors.green[400],
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Calcium: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].calcium.toString() + " mg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Iron: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].iron.toString() + " mg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Potassium: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].potassium.toString() + " mg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Sodium: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].sodium.toString() + " mg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Selenium: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].selenium.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Divider(
                                color: Colors.green[400],
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin A: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitA.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin B: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitB.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin C: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitC.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin D: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitD.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin E: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitE.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 4.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Text("Vitamin K: ",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    items[index].vitK.toString() + " µg",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
