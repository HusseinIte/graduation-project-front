// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;

  final void Function()? onPressedSearch;

  final TextEditingController mycontroller;
  final IconData iconData;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.mycontroller,
      this.iconData = Icons.favorite_border_outlined})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
            prefixIcon: IconButton(
                icon: Icon(Icons.search), onPressed: onPressedSearch),
            hintText: titleappbar,
            hintStyle: TextStyle(fontSize: 18),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.grey[200]),
      )),
      SizedBox(width: 5),
    ]);
  }
}
