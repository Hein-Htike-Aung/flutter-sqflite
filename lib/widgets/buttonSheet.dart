import 'package:flutter/material.dart';
import 'package:task/utils/theme.dart';

class ButtonSheet extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;
  final bool? isClose;

  const ButtonSheet(
      {super.key,
      required this.label,
      required this.onTap,
      this.color,
      this.isClose = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 40,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.grey.shade800 : color!,
          ),
          color: isClose == true ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: isClose == true
                ? titleStyle
                : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
