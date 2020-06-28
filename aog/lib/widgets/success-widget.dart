import 'package:aog/helpers/LayoutHelper.dart';
import 'package:flutter/material.dart';
import 'loading-button-widget.dart';

class Success extends StatelessWidget {
  String result = "";
  Function reset;

  Success({@required this.result, @required this.reset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            result,
            style: new LayoutHelper()
                .textStyle(Theme.of(context).primaryColor, 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          LoadingButton(
              busy: false,
              invert: true,
              func: reset,
              text: "CALCULAR NOVAMENTE"),
        ],
      ),
    );
  }
}
