import 'package:flutter/material.dart';

class ContainerPriority extends StatelessWidget {
  final Color color;
  final String text;
  const ContainerPriority({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 10),
      width: 101,
      height: 31,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
