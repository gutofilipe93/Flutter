import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/Item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ToDo',      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primarySwatch: Colors.blue,        
        visualDensity: VisualDensity.adaptivePlatformDensity,        
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = List<Item>();

  HomePage(){
    items = [];
  }
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add(){
    if(newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(Item(
        title: newTaskCtrl.text,
        done: false
      ));
      newTaskCtrl.clear();
      save();
    });
  }

  void remove(index){
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var pref = await SharedPreferences.getInstance();
    var data  = pref.getString('data');

    if(data != null){
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((e) => Item.fromJson(e)).toList();
      setState(() {
        widget.items = result;
      });
    }

  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }
  _HomePageState(){
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("10/10"),
        title: TextFormField(
          keyboardType: TextInputType.text,
          controller: newTaskCtrl,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",

          ),
        ),
        actions: <Widget>[
          Icon(Icons.plus_one)
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index){
          final item = widget.items[index];
          return Dismissible(
            child: CheckboxListTile(
            title: Text(item.title),
            value: item.done,            
            onChanged: (value){
              setState(() {
                item.done = value;
                save();
              });
            },
          ) ,
          key: Key(item.title),
          background: Container(
            color: Colors.red.withOpacity(0.2),
          ),
          onDismissed: (direction){
            remove(index);
          },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}