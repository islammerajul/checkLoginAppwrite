import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomChip extends StatelessWidget {
  CustomChip({super.key,
  this.backgroundcolor,this.label
  });
  String? label;
  Color? backgroundcolor;
  

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        child: Text(label![0].toUpperCase()),
      ),
      label: Text(label!),
      backgroundColor: backgroundcolor,
    );
  }
}
