import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
void main(){
  runApp(Weat());
}
class Weat extends StatelessWidget {
  const Weat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: WeatApp(),
    );
  }
}
class WeatApp extends StatefulWidget {
  const WeatApp({super.key});

  @override
  State<WeatApp> createState() => _WeatAppState();
}
class _WeatAppState extends State<WeatApp> {
  var tittle='chennai';
  var tittle3 = '';

  TextEditingController location =TextEditingController();
  String apiname='YZK9wQs0km9UiTKKGYboLacXKQNXg7Kz';
  String WeatData='';
  void WeatherData()async{
    final Uri uri=Uri.parse('https://api.tomorrow.io/v4/weather/realtime?location=${tittle}&apikey=YZK9wQs0km9UiTKKGYboLacXKQNXg7Kz');
    final response =await http.get(uri);
    if(response.statusCode==200){
      setState(() {
        WeatData=json.decode(response.body).toString();
      });
    }else{
      throw Exception('load faild retry');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: location,
              decoration: InputDecoration(
                border:OutlineInputBorder(),
              ),
              onChanged: (chennai){
                setState(() {
                  tittle=chennai;
                }
                );
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            WeatherData();
          },
              child: Text('Search Area')
          ),
          Expanded(child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:Column(
                  children: [
                    Text(WeatData),
                  ],
                )
            ),
          ))
        ],
      ),
    );
  }
}
