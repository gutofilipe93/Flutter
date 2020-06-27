import 'package:aog/helpers/TextStyleHelper.dart';
import 'package:aog/widgets/input.dart';
import 'package:aog/widgets/logo-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var textStyleHelper = new TextStyleHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Input(_gasController, "Gasolina"),
          Input(_alcoolController, "Álcool"),
          Container(
            margin: EdgeInsets.all(30),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              child: Text(
                "CALCULAR",
                style: textStyleHelper.textStyle(),
                textAlign: TextAlign.center,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
