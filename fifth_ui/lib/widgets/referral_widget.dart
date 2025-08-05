import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fifth_ui/utils/app_colors.dart';
import 'package:fifth_ui/widgets/referred_users_widget.dart';
import 'package:fifth_ui/models/referred_user.dart';

class ReferralWidget extends StatelessWidget {

  final String referralCode;
  const ReferralWidget({super.key, required this.referralCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Text(
            "Referral",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Text(
                    referralCode,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ),
              SizedBox(width: 8.0,),
              GestureDetector(
                onTap: () => _copyToClipboard(context),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.copy,
                    color: AppColors.black,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 8.0,),
              GestureDetector(
                onTap: () => _shareReferralCode(),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.share,
                    color: AppColors.black,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16.0),
          ReferredUsersWidget(referredUsers: _getReferredUsers()),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Referral code copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareReferralCode(){
    print("Sharing referral code: $referralCode");
  }

  List<ReferredUser> _getReferredUsers() {
    return [
      ReferredUser(
        name: 'Michael',
        avatarUrl: 'assets/profile.jpg',
        isVerified: true,
      ),
      ReferredUser(
        name: 'James',
        avatarUrl: 'assets/profile.jpg',
        isVerified: false,
      ),
      ReferredUser(
        name: 'Robert',
        avatarUrl: 'assets/profile.jpg',
        isVerified: true,
      ),
    ];
  }
}