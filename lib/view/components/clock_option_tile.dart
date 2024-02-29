import 'package:flutter/material.dart';

Widget clockOptionTile({
  required String title,
  required bool val,
  required Function(bool) onchanged,
}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Switch(
          value: false,
          onChanged: (val) {},
        ),
      ],
    ),
  );
}
