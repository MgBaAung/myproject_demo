

import 'package:flutter/material.dart';

//custom_button
import 'package:myproject/src/features/share/widget/custom_text_button.dart';

//app_style
import 'package:myproject/src/helper/constants/app_typography.dart';

// Helpers
import 'package:myproject/src/helper/constants/app_assets.dart';
import 'package:myproject/src/helper/constants/app_color.dart';
import 'package:myproject/src/helper/constants/app_style.dart';

// Routing
import '../../config/routes/app_router.dart';
import '../../config/routes/routes.dart';


class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightBackgroundColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 125, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading text
            Text(
              'My Project',
              style: AppTypography.primary.heading34.copyWith(
                color: AppColors.primaryColor,
                fontSize: 60,
              ),
            ),

            const SizedBox(height: 35),

            // Welcome msg
            Text(
              "Welcome to\nIBA's first\ncommunity app",
              style: AppTypography.primary.heading34,
            ),

            const SizedBox(height: 40),

            // Experience msg
            Text(
              'New level of features,\nmade entirely for the students',
              style: AppTypography.primary.heading22.copyWith(
                color: AppColors.textGreyColor,
                fontWeight: FontWeight.w400,
              ),
            ),

            const Spacer(),

            // Login row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Login button
                Expanded(
                  child: CustomTextButton.gradient(
                    width: double.infinity,
                    onPressed: () {
                      AppRouter.pushNamed(Routes.LoginScreenRoute);
                    },
                    gradient: AppColors.buttonGradientPurple,
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Face id
                CustomTextButton.gradient(
                  width: 60,
                  onPressed: () {},
                  gradient: AppColors.buttonGradientPurple,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(AppAssets.faceId),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 17),

            // Register button
            CustomTextButton.outlined(
              width: double.infinity,
              onPressed: () {
                AppRouter.pushNamed(Routes.RegisterScreenRoute);
              },
              border: Border.all(
                color: AppColors.primaryColor,
                width: 2.5,
              ),
              child: const Center(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            Insets.bottomInsetsLow,
          ],
        ),
      ),
    );
  }
}
