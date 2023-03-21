import 'package:flutter/material.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  bool isIcon;
  IconData? icon;
  String? text;
  double size;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;

  AppButton({
    Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: isIcon
            ? Icon(
                icon,
                color: color,
              )
            : AppText(
                text: text!,
                color: color,
              ),
      ),
    );
  }
}
