import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "搜尋條件",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "距離",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          Slider(
            value: 5,
            min: 1,
            max: 10,
            divisions: 9,
            label: "5 km",
            onChanged: (_) {},
          ),

          const SizedBox(height: 20),

          const Text(
            "價格",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              Chip(label: Text("\$50 以下")),
              Chip(label: Text("\$50 - \$100")),
              Chip(label: Text("\$100 - \$200")),
              Chip(label: Text("\$200+")),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            "料理種類",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            value: "日式",
            items: const [
              DropdownMenuItem(
                value: "日式",
                child: Text("日式"),
              ),
              DropdownMenuItem(
                value: "港式",
                child: Text("港式"),
              ),
              DropdownMenuItem(
                value: "韓式",
                child: Text("韓式"),
              ),
              DropdownMenuItem(
                value: "西餐",
                child: Text("西餐"),
              ),
            ],
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}