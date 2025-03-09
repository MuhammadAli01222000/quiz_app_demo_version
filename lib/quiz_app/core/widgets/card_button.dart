import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/core/config/routes.dart';
import 'dart:async';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/strings.dart';

class CardQuestion extends StatefulWidget {
  final int count;
  final bool onPressed;
  final int level;
  final int son1;
  final int son2;
  final int result;
  final VoidCallback onTimeUp;
  const CardQuestion({
    super.key,
    required this.son1,
    required this.onPressed,
    required this.son2,
    required this.result,
    required this.level,
    required this.count,
    required this.onTimeUp,
  });
  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

class _CardQuestionState extends State<CardQuestion> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    // count += 1;
    return Align(
      alignment: Alignment(0, -1),
      child: SizedBox(
        width: double.infinity,
        height: AppDimens.d221,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// katta carta
            Positioned(
              child: Card(
                color: AppColors.mainAndBottomSheetColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 10,
                  height: 180,
                  child: Center(
                    child: Container(
                      width: 65,
                      height: 65,
                      color: AppColors.transparent,
                      // child: Align(
                      //   alignment: Alignment.topLeft,
                      //   child: TimerWidget(isPressed: widget.onPressed),
                      // ),
                    ),
                  ),
                ),
              ),
            ),

            ///oq card
            Positioned(
              top: 125,
              left: 30,
              right: 30,
              child: Card(
                color: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ScoreQuestion(count: count, widget: widget),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// id orqali levelni anqilash va savollarni sanash
class ScoreQuestion extends StatelessWidget {
  const ScoreQuestion({super.key, required this.count, required this.widget});
  final int count;
  final CardQuestion widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment(0, -0.9),
            child: Text(
              "${AppTexts.question} $count/10",
              style: TextStyle(
                color: AppColors.timerAndTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// level orqali  qaysi buttonni bosganini aniqlash
          widget.level == 1
              ? Text("${widget.son1} + ${widget.son2} =  ?")
              : widget.level == 2
              ? Text("${widget.son1} - ${widget.son2} =  ?")
              : widget.level == 3
              ? Text("${widget.son1} x ${widget.son2} =  ?")
              : Container(),
        ],
      ),
    );
  }
}

///timer
class TimerWidget extends StatefulWidget {
  bool isPressed;
  TimerWidget({super.key, required this.isPressed});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int timeLeft = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    timeLeft = 20;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        check(timeLeft);
      }
    });
  }

  void check(int timeLeft) {
    if (timeLeft == 0) {
      setState(() {
        // Navigator.pushNamed(context, AppRoutes.second, arguments: 1);
      });
    }
  }

  void resetTimer() {
    setState(() {
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: resetTimer, // Har safar tugma bosilganda timer reset bo‘ladi
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              color: AppColors.mainAndBottomSheetColor,
              strokeWidth: 4,
              value: timeLeft / 20,
            ),
          ),
          Text(
            "$timeLeft",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleNested extends StatelessWidget {
  final List<int> listScore;
  const CircleNested({super.key, required this.listScore});

  @override
  Widget build(BuildContext context) {
    int correct = listScore[1];
    int sum = 10 * correct;

    return Align(
      alignment: Alignment(0, -1),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
        child: SizedBox(
          width: AppDimens.d411,
          height: 300,
          child: ColoredBox(
            color: AppColors.mainAndBottomSheetColor,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Card(
                  shape: CircleBorder(),
                  color: Colors.purple.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 105,
                      height: 105,
                      child: Card(
                        shape: CircleBorder(),
                        color: Colors.purple.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(6.5),
                          child: Padding(
                            padding: const EdgeInsets.all(5.4),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Card(
                                shape: CircleBorder(),
                                color: Colors.purple.shade100,
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Card(
                                    shape: CircleBorder(),
                                    color: Colors.purple.shade100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Card(
                                          shape: CircleBorder(),
                                          color: AppColors.white,
                                          child: OverallResults(sum: sum),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///umumiy natijalar
class OverallResults extends StatelessWidget {
  const OverallResults({super.key, required this.sum});

  final int sum;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppTexts.score,
            style: TextStyle(color: AppColors.timerAndTextColor),
          ),
          Text(
            "$sum",
            style: TextStyle(
              color: AppColors.mainAndBottomSheetColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
