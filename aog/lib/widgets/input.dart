import 'package:aog/helpers/LayoutHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  String label = '';

  Input({@required this.gasController, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: new LayoutHelper().textStyle(Colors.white, 35),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: gasController,
            style: new LayoutHelper().textStyle(Colors.white, 35),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
