import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jellyfish Classifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClassifierHomePage(),
    );
  }
}

class ClassifierHomePage extends StatefulWidget {
  const ClassifierHomePage({Key? key}) : super(key: key);

  @override
  _ClassifierHomePageState createState() => _ClassifierHomePageState();
}

class _ClassifierHomePageState extends State<ClassifierHomePage> {
  String _classResult = 'Class will be displayed here';
  String _probabilityResult = 'Probability will be displayed here';

  Future<void> _getClassPrediction() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8004/predict/class'));
    final data = json.decode(response.body);
    setState(() {
      _classResult = 'Class : ${data['class']}';
    });
  }

  Future<void> _getProbabilityPrediction() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8004/predict/probability'));
    final data = json.decode(response.body);
    setState(() {
      _probabilityResult =
          'Probability: ${data['probability'].toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jellyfish Classifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Align items to the start of the column
          children: <Widget>[
            // Display the jellyfish image
            Image.asset(
                'assets/images/jellyfish.jpg'), // Remove Expanded to allow the image to take its natural size
            // Create a row for buttons
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // This will space out the buttons evenly
              children: <Widget>[
                ElevatedButton(
                  onPressed: _getClassPrediction,
                  child: const Text('Class'),
                ),
                ElevatedButton(
                  onPressed: _getProbabilityPrediction,
                  child: const Text('Probability Pred'),
                ),
              ],
            ),
            // Display the prediction results
            Text(_classResult),
            Text(_probabilityResult),
          ],
        ),
      ),
    );
  }
}
