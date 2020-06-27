import 'package:aog/helpers/TextStyleHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  String label = '';

  Input(@required this.gasController, @required this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: new TextStyleHelper().textStyle(),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: gasController,
            style: new TextStyleHelper().textStyle(),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
