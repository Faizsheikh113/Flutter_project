import 'package:flutter/material.dart';

class RoundeButton extends StatelessWidget {
  final String Title;
  final VoidCallback onPress;
  final double height;
  final double width;
  const RoundeButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPress,
    required this.Title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(child: Text(Title)),
      ),
    );
  }
}
