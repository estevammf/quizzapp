
import 'package:flutter/material.dart';
import 'package:quizapp/home/widgets/scorecard/score_card_widget.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user}) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            decoration: BoxDecoration( gradient: AppGradients.linear ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Olá, ", style: AppTextStyles.title,
                    children:  [
                      TextSpan(
                          text: user.name,
                          style: AppTextStyles.titleBold,
                        )
                        ]
                    )
                  ),
                Container(
                  width:58,
                  height:58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: (user.picture != null ? NetworkImage(user.picture!) : AssetImage(AppImages.userDefault)) as ImageProvider<Object>)
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ScoreCardWidget(percent: 0)
            )
        ],
      ),
    )
  );
}