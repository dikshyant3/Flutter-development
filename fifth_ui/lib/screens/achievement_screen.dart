import 'package:fifth_ui/widgets/challenge_widget.dart';
import 'package:fifth_ui/widgets/referral_widget.dart';
import 'package:fifth_ui/widgets/loyalty_widget.dart';
import 'package:flutter/material.dart';
import 'package:fifth_ui/utils/app_colors.dart';
import 'package:fifth_ui/models/loyalty_level.dart';
import 'package:fifth_ui/models/challenge.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18.0,
                color: AppColors.black,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
      title: const Text(
        'Achievements',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              "assets/profile.jpg",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoyaltyLevelWidget(loyaltylevels: _getLoyaltyLevels()),
            SizedBox(height: 16.0),
            ChallengeWidget(challenge: _getChallengeValues(),),
            SizedBox(height: 16.0),
            ReferralWidget(referralCode: '#549807AD'),
          ],
        )
      ),
    );
  }

  List<LoyaltyLevel> _getLoyaltyLevels() {
    return [
      LoyaltyLevel(type:LoyaltyLevelType.bronze, name: 'Bronze', color: AppColors.bronze),
      LoyaltyLevel(type:LoyaltyLevelType.silver, name: 'Silver', color: AppColors.silver),
      LoyaltyLevel(type:LoyaltyLevelType.gold, name: 'Gold', color: AppColors.gold),
    ];
  }

  Challenge _getChallengeValues() {
    return 
      Challenge(
        title: 'Challenges',
        description: 'Complete 5 bookings this month and earn 2% cashback',
        timeLeft: '2 days left',
        progress: 0.15,
        status: 'Pending',
      );
  }
}
