import 'package:flutter/material.dart';
import 'package:fifth_ui/utils/app_colors.dart';
import 'package:fifth_ui/models/challenge.dart';

class ChallengeWidget extends StatelessWidget {

  final Challenge challenge;
  const ChallengeWidget({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black.withAlpha(10),
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                challenge.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black),
              ),
              Text(
                challenge.timeLeft,
                style: TextStyle(fontSize: 14, color: AppColors.grey),
              ),
            ],
          ),
          Text(
            challenge.description,
            style: const TextStyle(fontSize: 14, color: AppColors.grey),
          ),
          const SizedBox(height: 8.0),
          _buildProgressBar(),
          SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(challenge.progress * 10).toStringAsFixed(1)}% reached',
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.black),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: AppColors.orange.withAlpha(10),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  challenge.status,
                  style: TextStyle(color: AppColors.orange, fontSize: 14.0),
                ) ,
              )
            ],
          )
        ],
        )
    );
  }
  Widget _buildProgressBar() {
    return Container(
      height: 8.0,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: challenge.progress, 
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