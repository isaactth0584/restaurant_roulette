import 'package:flutter/material.dart';

class WheelSection extends StatelessWidget {
  const WheelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
              spreadRadius: 2,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🎯",
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 16),
            Text(
              "開始抽餐",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}