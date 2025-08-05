import 'package:fifth_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fifth_ui/models/loyalty_level.dart';

class LoyaltyLevelWidget extends StatelessWidget {
  final List<LoyaltyLevel> loyaltylevels;

  const LoyaltyLevelWidget({super.key, required this.loyaltylevels});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Loyalty Levels',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: loyaltylevels.map((level)=> _buildLoyaltyLevel(level)).toList(),
          ),
          const SizedBox(height: 8.0),
          _buildProgressBar(),
          const SizedBox(height: 8.0),
          const Text(
            "You're 2 bookings away from Silver",
            style:TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            )
          )
        ],
      ),
    );
  }

  Widget _buildLoyaltyLevel(LoyaltyLevel level) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: level.color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.star,
            color: AppColors.white,
            size: 28.0,
          )
        ),
        const SizedBox(height: 4.0),
        Text(
          level.name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        )
      ],
    );
  }

  // Progress bar
  Widget _buildProgressBar() {
    return Container(
      height: 8.0,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5, 
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}