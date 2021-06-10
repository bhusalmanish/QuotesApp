import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiUrl = "https://type.fit/api/quotes";
  String currentQuotes = "Hello";
  var random = new Random();

  readAPI(int id) async {
    final response = await http.get(Uri.parse(apiUrl));
    int newValue = random.nextInt(20);
    var data = convert.jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        currentQuotes = data[id]['text'];
      });
      print(data[1]['text']['aurthor']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Card(
                margin: EdgeInsets.all(3),
                color: Colors.grey[200],
                child: Container(
                    height: 200,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          currentQuotes,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                    color: Colors.blueGrey,
                    child: Text(
                      "Previous",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    highlightColor: Colors.blueAccent[400],
                    focusColor: Colors.red,
                    height: 50,
                    // minWidth: 30,
                    hoverColor: Colors.purple[300],
                    onPressed: () async {
                      readAPI(random.nextInt(500));
                    }),
                MaterialButton(
                    color: Colors.blueGrey,
                    child: Text(
                      "  Next  ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    highlightColor: Colors.blueAccent[400],
                    focusColor: Colors.red,
                    height: 50,
                    // minWidth: 30,
                    hoverColor: Colors.purple[300],
                    onPressed: () async {
                      readAPI(random.nextInt(500));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
