import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/core/config/routes.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/colors.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/dimens.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/strings.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/text_style.dart';

import '../core/widgets/app_button.dart';

const backgroundImagePath = "asset/png/img_1.png";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundImage(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppDimens.d22),
          child: Column(
            children: [
              Text(AppTexts.quizzly, style: AppTextStyle.quizly),
              const SizedBox(height: 20),

              /// card info
              const Align(
                alignment: Alignment(0, -0.2),
                child: Card(
                  color: AppColors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          AppTexts.welcome,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.timerAndTextColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppTexts.info,
                          style: const TextStyle(
                            color: AppColors.timerAndTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                AppTexts.choose,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppDimens.d22,
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: AppDimens.levelButtonWidth,
                height: AppDimens.levelButtonHeight,
                child: CustomButton(
                  text: AppTexts.level1,
                  color: AppColors.white,
                  textColor: AppColors.white,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.second,
                      arguments: 1,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: AppDimens.levelButtonWidth,
                height: AppDimens.levelButtonHeight,
                child: CustomButton(
                  text: AppTexts.level2,
                  color: AppColors.white,
                  textColor: AppColors.white,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.second,
                      arguments: 2,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: AppDimens.levelButtonWidth,
                height: AppDimens.levelButtonHeight,
                child: CustomButton(
                  text: AppTexts.level3,
                  color: AppColors.white,
                  textColor: AppColors.white,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.second,
                      arguments: 3,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(backgroundImagePath),
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(
          AppColors.mainAndBottomSheetColor,
          BlendMode.lighten,
        ),
      ),
    );
  }
}
