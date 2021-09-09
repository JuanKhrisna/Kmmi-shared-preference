import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage ({Key? key}) : super (key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> keywords = [];
  TextEditingController searchController = TextEditingController();
   
   void addKeyword(String value) async{ 
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       keywords.add(value);
       searchController.text = "";
     });
     prefs.setStringList('keywords', keywords);
   }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              TextField(
                controller: searchController,
                onSubmitted: (value) {
                  addKeyword(value);
                },
                textInputAction: TextInputAction.search,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return ListTile(title: Text (
                      keywords[index]
                      ),
                    );
                  },
                  itemCount: keywords.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}