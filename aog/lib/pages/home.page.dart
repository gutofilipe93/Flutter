import 'package:aog/helpers/LayoutHelper.dart';
import 'package:aog/widgets/logo-widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/success-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var textStyleHelper = new LayoutHelper();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";
  var _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      reset: reset,
                      result: _resultText,
                    )
                  : SubmitForm(
                      alcoolController: _alcoolController,
                      gasController: _gasController,
                      busy: _busy,
                      func: calculate)
            ],
          ),
        ));
  }

  Future calculate() {
    double alc = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), "")) /
        100;

    double gas = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), "")) /
        100;

    if (alc == 0 && gas == 0) return null;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
      _color = Colors.blue;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Alcool";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _alcoolController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
