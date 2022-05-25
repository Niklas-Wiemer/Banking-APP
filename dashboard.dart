import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createCustomWidget() {
  
  return new Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text("Abmelden")
    ],
  );
}
