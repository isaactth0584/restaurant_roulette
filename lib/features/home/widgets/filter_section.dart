import 'package:flutter/material.dart';

import '../../../core/constants/cuisine_types.dart';

class FilterSection extends StatefulWidget {
  final double distance;
  final int priceLevel;
  final CuisineType selectedCuisine;

  final ValueChanged<double> onDistanceChanged;
  final ValueChanged<int> onPriceChanged;
  final ValueChanged<CuisineType> onCuisineChanged;

  const FilterSection({
    super.key,
    required this.distance,
    required this.priceLevel,
    required this.selectedCuisine,
    required this.onDistanceChanged,
    required this.onPriceChanged,
    required this.onCuisineChanged,
  });

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
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

          //---------------------------------------------------
          // Distance
          //---------------------------------------------------

          Text(
            "距離 (${widget.distance.toStringAsFixed(1)} km)",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          Slider(
            value: widget.distance,
            min: 0.5,
            max: 10,
            divisions: 19,
            label: "${widget.distance.toStringAsFixed(1)} km",
            onChanged: widget.onDistanceChanged,
          ),

          const SizedBox(height: 24),

          //---------------------------------------------------
          // Price
          //---------------------------------------------------

          const Text(
            "價格",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [

              ChoiceChip(
                label: const Text("不限"),
                selected: widget.priceLevel == 0,
                onSelected: (_) {
                  widget.onPriceChanged(0);
                },
              ),

              ChoiceChip(
                label: const Text("\$"),
                selected: widget.priceLevel == 1,
                onSelected: (_) {
                  widget.onPriceChanged(1);
                },
              ),

              ChoiceChip(
                label: const Text("\$\$"),
                selected: widget.priceLevel == 2,
                onSelected: (_) {
                  widget.onPriceChanged(2);
                },
              ),

              ChoiceChip(
                label: const Text("\$\$\$"),
                selected: widget.priceLevel == 3,
                onSelected: (_) {
                  widget.onPriceChanged(3);
                },
              ),

              ChoiceChip(
                label: const Text("\$\$\$\$"),
                selected: widget.priceLevel == 4,
                onSelected: (_) {
                  widget.onPriceChanged(4);
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          //---------------------------------------------------
          // Cuisine
          //---------------------------------------------------

          const Text(
            "料理種類",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<CuisineType>(
            value: widget.selectedCuisine,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            items: cuisineTypes.map((cuisine) {
              return DropdownMenuItem(
                value: cuisine,
                child: Text(
                  "${cuisine.emoji}  ${cuisine.name}",
                ),
              );
            }).toList(),

            onChanged: (value) {
              if (value != null) {
                widget.onCuisineChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}