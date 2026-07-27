import 'package:flutter/material.dart';

class BottomNavSection extends StatelessWidget {
  const BottomNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _Item(Icons.home_rounded, "首頁", true),
          _Item(Icons.favorite_outline, "收藏", false),
          _Item(Icons.history, "紀錄", false),
          _Item(Icons.settings_outlined, "設定", false),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const _Item(
    this.icon,
    this.title,
    this.active,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: active ? Colors.orange : Colors.grey,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            color: active ? Colors.orange : Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}