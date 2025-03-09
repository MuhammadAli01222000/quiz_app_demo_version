import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/core/config/routes.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/dimens.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/strings.dart';
import 'package:git_and_gitlab/quiz_app/core/widgets/app_button.dart';
import 'package:git_and_gitlab/quiz_app/services/quiz_controller.dart';
import 'package:lottie/lottie.dart';
import '../asset/icons/app_icons.dart';
import '../core/theme/colors.dart';
import '../core/widgets/card_button.dart';

const imgPath = "lib/quiz_app/asset/animation/anim - 1741330512672.json";
const animPathFailed = "lib/quiz_app/asset/animation/failed.json";
const animPathEasy = "lib/quiz_app/asset/animation/easy_level.json";

class ThirdPage extends StatefulWidget {
  final List<int> list;

  const ThirdPage({super.key, required this.list});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
      });
    });
  }

  bool isWin = false;
  bool isFailed = false;
  bool isEasy = false;
  final controller = ScrollController();

  /// balga qarab uni baholash
  Text checkCorrect(int correct) {
    if (correct >= 0 && correct < 6) {

      isFailed = true;
      return Text("Failed Try again", style: TextStyle(color: AppColors.red));
    }
    if (correct >= 6 && correct <= 7) {
      isEasy = true;

      return Text(
        "Satisfactory Meets minimum requirements, but more work is needed",
        style: TextStyle(color: Colors.yellow),
      );
    }
    if (correct >= 7 && correct < 9) {
      isEasy = true;

      return Text(
        "Good result, few errors",
        style: TextStyle(color: Colors.greenAccent),
      );
    }
    if (correct > 9 && correct <= 10) {
      isWin = true;
      return Text("Successful", style: TextStyle(color: AppColors.green));
    } else {
      return Text("Failed Try again", style: TextStyle(color: AppColors.red));
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    int wrong = widget.list[0];
    int correct = widget.list[1];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: buildAppBar(context, wrong, correct),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (isWin)
                      Center(
                        child: Lottie.asset(imgPath, width: 200, height: 200),
                      ),
                    if (isFailed)
                      Center(
                        child: Lottie.asset(
                          animPathFailed,
                          width: 40,
                          height: 50,
                        ),
                      ),
                    if (isEasy)
                      Center(
                        child: Lottie.asset(
                          animPathEasy,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    checkCorrect(correct),
                    Center(
                      child: SizedBox(
                        height: AppDimens.d170,
                        width: AppDimens.d336,
                        child: Card(
                          elevation: 10,
                          shadowColor: AppColors.black,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GreenCircle(),
                                  CounterCorrect(correct: correct),
                                  SizedBox(width: 150),
                                  RedCircle(),
                                  CounterWrong(wrong: wrong),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    SizedBox(
                      width: AppDimens.levelButtonWidth,
                      height: AppDimens.levelButtonHeight,
                      child: CustomButton(
                        text: AppTexts.play,
                        function: () {
                          Navigator.pushNamed(context, AppRoutes.second);
                        },
                        color: AppColors.mainAndBottomSheetColor,
                        textColor: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: AppDimens.levelButtonWidth,
                      height: AppDimens.levelButtonHeight,
                      child: CustomButton(
                        text: AppTexts.home,
                        function: () {
                          Navigator.pushNamed(context, AppRoutes.home);
                        },
                        color: AppColors.mainAndBottomSheetColor,
                        textColor: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: AppDimens.levelButtonWidth,
                  height: AppDimens.levelButtonHeight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      AppTexts.quizzly,
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.mainAndBottomSheetColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int wrong, int correct) {
    return AppBar(
      leading: arrowBackButton(context),
      flexibleSpace: Container(
        child: Center(child: CircleNested(listScore: [wrong, correct])),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppDimens.d16),
            bottomLeft: Radius.circular(AppDimens.d16),
          ),
          color: AppColors.mainAndBottomSheetColor,
        ),
      ),
    );
  }
}

///togri javiblarni sanash
class CounterCorrect extends StatelessWidget {
  const CounterCorrect({super.key, required this.correct});

  final int correct;

  @override
  Widget build(BuildContext context) {
    return Text(
      "  ${correct} Correct",
      style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold),
    );
  }
}

class CounterWrong extends StatelessWidget {
  const CounterWrong({super.key, required this.wrong});

  final int wrong;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${wrong} Wrong ",
      style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
    );
  }
}
