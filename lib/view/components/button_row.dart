import 'package:flutter/material.dart';

Widget buttonRow({
  required StringbtnName,
  required Widget button,
}) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(StringbtnName),
        button,
      ],
    ),
  );
}
