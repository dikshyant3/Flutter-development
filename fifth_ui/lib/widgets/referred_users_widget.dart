import 'package:flutter/material.dart';
import '../models/referred_user.dart';
import '../utils/app_colors.dart';

class ReferredUsersWidget extends StatelessWidget {
  final List<ReferredUser> referredUsers;

  const ReferredUsersWidget({super.key, required this.referredUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Referred Users',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16),
          ...referredUsers.map((user) => _buildReferredUser(user)),
        ],
      ),
    );
  }

  Widget _buildReferredUser(ReferredUser user) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(user.avatarUrl),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: user.isVerified ? AppColors.green : AppColors.lightGrey,
              borderRadius: BorderRadius.circular(4),
            ),
            child: user.isVerified
                ? Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 16,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}