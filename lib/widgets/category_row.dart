import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CategoryCard(
          icon: Icons.hotel,
          label: 'Hotels',
          color: Color(0xFFFFE8D6),
        ),
        CategoryCard(
          icon: Icons.flight,
          label: 'Flights',
          color: Color(0xFFFFD7E3),
        ),
        CategoryCard(
          icon: Icons.directions_walk,
          label: 'All',
          color: Color(0xFFD7F8F0),
        ),
      ],
    );
  }
}
