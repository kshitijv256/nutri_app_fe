import 'dart:convert';
// import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

String url = 'http://127.0.0.1:5000';

class FoodItem {
  final String category;
  final String details;
  final String energy;
  final String totalFat;
  final String protien;
  final String carbs;
  final String sugar;
  final String fiber;

  final String calcium;
  final String iron;
  final String magnesium;
  final String phosphorus;
  final String potassium;
  final String sodium;
  final String zinc;
  final String copper;
  final String manganese;
  final String selenium;

  final String vitC;
  final String vitA;
  final String vitE;
  final String vitK;
  final String vitD;
  final String vitB;

  final String cholesterol;

  final String score;

  const FoodItem({
    required this.category,
    required this.details,
    required this.energy,
    required this.totalFat,
    required this.protien,
    required this.carbs,
    required this.sugar,
    required this.fiber,
    required this.calcium,
    required this.iron,
    required this.magnesium,
    required this.phosphorus,
    required this.potassium,
    required this.sodium,
    required this.zinc,
    required this.copper,
    required this.manganese,
    required this.selenium,
    required this.vitC,
    required this.vitA,
    required this.vitE,
    required this.vitK,
    required this.vitD,
    required this.vitB,
    required this.cholesterol,
    required this.score,
  });
// 'Energ_Kcal': [718, 717, 717, 499, 499]
  factory FoodItem.fromJson(Map<String, dynamic> json, int idx) {
    return FoodItem(
      category: json['Category'][idx],
      details: json['desc'][idx],
      energy: json['Energ_Kcal'][idx].toString(),
      totalFat: json['Lipid_Tot_(g)'][idx].toString(),
      protien: json['Protein_(g)'][idx].toString(),
      carbs: json['Carbohydrt_(g)'][idx].toString(),
      sugar: json['Sugar_Tot_(g)'][idx].toString(),
      fiber: json['Fiber_TD_(g)'][idx].toString(),
      calcium: json['Calcium_(mg)'][idx].toString(),
      iron: json['Iron_(mg)'][idx].toString(),
      magnesium: json['Magnesium_(mg)'][idx].toString(),
      phosphorus: json['Phosphorus_(mg)'][idx].toString(),
      potassium: json['Potassium_(mg)'][idx].toString(),
      sodium: json['Sodium_(mg)'][idx].toString(),
      zinc: json['Zinc_(mg)'][idx].toString(),
      copper: json['Copper_mg)'][idx].toString(),
      manganese: json['Manganese_(mg)'][idx].toString(),
      selenium: json['Selenium_(µg)'][idx].toString(),
      vitC: json['Vit_C_(mg)'][idx].toString(),
      vitA: json['Vit_A_IU'][idx].toString(),
      vitE: json['Vit_E_(mg)'][idx].toString(),
      vitK: json['Vit_K_(µg)'][idx].toString(),
      vitD: json['Vit_D_µg'][idx].toString(),
      vitB: json['Vitamin B'][idx].toString(),
      cholesterol: json['Cholestrl_(mg)'][idx].toString(),
      score: json['score'][idx].toString(),
    );
  }
  @override
  String toString() {
    return 'FoodItem(category: $category, details: $details, energy: $energy, totalFat: $totalFat, protien: $protien, carbs: $carbs, sugar: $sugar, fiber: $fiber, calcium: $calcium, iron: $iron, magnesium: $magnesium, phosphorus: $phosphorus, potassium: $potassium, sodium: $sodium, zinc: $zinc, copper: $copper, manganese: $manganese, selenium: $selenium, vitC: $vitC, vitA: $vitA, vitE: $vitE, vitK: $vitK, vitD: $vitD, vitB: $vitB, cholesterol: $cholesterol, score: $score)';
  }
}

Future<List> fetchData(query) async {
  final response = await http.get(Uri.parse('$url/find?details=$query'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List foodItems = [];
    var data = jsonDecode(response.body);
    for (var i = 0; i < data['Category'].length; i++) {
      foodItems.add(FoodItem.fromJson(data, i));
    }
    return foodItems;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

// Future request() async {
//   FoodItem item1 = await fetchData();
//   items.add(item1);
//   print(items);
// }
// var items = [];
// Future<void> main(List<String> args) async {
//   List items = await fetchData('BUTTER');
//   print(items);
// }
