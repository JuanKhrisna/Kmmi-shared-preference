import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  DetailPage(): super();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initSatae(){
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        var count = prefs.getInt('count') ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        child: Center(
          child: Text(
              '',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              ),
          ),
        ),
      ),
    );
  }
}