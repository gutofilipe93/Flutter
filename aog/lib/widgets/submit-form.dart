import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.dart';
import 'loading-button-widget.dart';

class SubmitForm extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  Function func;

  SubmitForm(
      {@required this.alcoolController,
      @required this.gasController,
      @required this.busy,
      @required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Input(gasController: gasController, label: "Gasolina"),
      ),
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Input(gasController: alcoolController, label: "Álcool"),
      ),
      SizedBox(
        height: 25,
      ),
      LoadingButton(busy: busy, invert: false, func: func, text: "CALCULAR"),
    ]);
  }
}
