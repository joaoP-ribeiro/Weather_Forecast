import 'package:flutter/material.dart';

class StatusView extends StatefulWidget {
  final String img;
  final String title;
  String status;

  StatusView({
    required this.img,
    required this.title,
    required this.status,
  });

  @override
  _Status createState() => _Status();
}

class _Status extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.img,
          scale: 8,
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              widget.status,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}
