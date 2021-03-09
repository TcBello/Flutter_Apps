import 'package:best_phone/style/style.dart';
import 'package:flutter/material.dart';

class CategoryListTile extends StatefulWidget {
  final bool isActive;
  final String title;
  CategoryListTile({this.isActive, this.title});

  @override
  _CategoryListTileState createState() => _CategoryListTileState();
}

class _CategoryListTileState extends State<CategoryListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(right: 30.0),
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )
      ),
      child: ListTile(
        title: Text(widget.title, style: categoryTextStyle(widget.isActive)),
      ),
    );
  }
}