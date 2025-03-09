import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:git_and_gitlab/quiz_app/core/config/routes.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/colors.dart';
import 'package:git_and_gitlab/quiz_app/core/theme/dimens.dart';
import 'package:git_and_gitlab/quiz_app/core/widgets/app_button.dart';
import '../core/widgets/card_button.dart';
import '../core/widgets/custom_dialog.dart';

class SecondPage extends StatefulWidget {
  final int level, result;

  /// qaysi level button boslganini olish uchun bu orqali + - * bajariladi
  const SecondPage({super.key, required this.level, required this.result});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool onPressed = false;
  int count = 0;
  int id = 0;
  int wrong = 0, correct = 0;
  List<int> list1 = [];
  List<int> list2 = [];
  List<int> listResult = [];

  @override
  void initState() {
    super.initState();
    id = widget.level;

    list1 = List.generate(11, (index) => index + 1);
    list2 = List.generate(11, (index) => index + 1);
    list2.shuffle();
    list1.shuffle();

    if (id == 1) {
      listResult = List.generate(11, (index) => list1[index] + list2[index]);
    } else if (id == 2) {
      listResult = List.generate(11, (index) => list1[index] - list2[index]);
    } else if (id == 3) {
      listResult = List.generate(11, (index) => list1[index] * list2[index]);
    } else {
      listResult = List.generate(11, (index) => list1[index] + list2[index]);
    }
  }

  Future<void> _playSound(String filePath) async {
    try {
      await _audioPlayer.setFilePath(filePath);
      await _audioPlayer.play();
    } catch (e, s) {
      debugPrint("Error loading audio:  $e,$s");
    }
  }

  Future<void> _playSoundWrong() async {
    try {
      await _audioPlayer.setFilePath("asset/sound/wrong2.wav");
      print("64 lines asset/sound/ringtone.wav");

      await _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: wrong2 $e");
    }
  }

  void checkAnswer(String selectedAnswer) async {
    int res = int.parse(selectedAnswer);

    debugPrint(
      "count: $count, correct answer: ${listResult[count]}, selected: $res",
    );

    if (res == listResult[count]) {
      correct++;
      _playSound("asset/sound/correct.wav");
      print("80 lines asset/sound/ringtone.wav");
    } else {
      wrong++;
      _playSoundWrong();
    }

    if (count == 9) {
      _playSound("asset/sound/ringtone.wav");
      print("88lines asset/sound/ringtone.wav");
      Navigator.pushNamed(
        context,
        AppRoutes.third,
        arguments: [wrong, correct],
      );
    } else {
      setState(() {
        count++;
      });
    }
  }

  void onTimeUp() async {
    setState(() {
      ///times
      count++;
    });

    if (count == 10) {
      await _playSound("asset/sound/input.wav");
      print("11 lines asset/sound/ringtone.wav");

      Navigator.pushNamed(
        context,
        AppRoutes.third,
        arguments: [wrong, correct],
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int correctAnswer = listResult[count];

    List<int> wrongAnswers = [];
    while (wrongAnswers.length < 3) {
      int randomValue = random.nextInt(20) + 1;
      if (randomValue != correctAnswer && !wrongAnswers.contains(randomValue)) {
        wrongAnswers.add(randomValue);
      }
    }

    List<int> answers = [correctAnswer, ...wrongAnswers];
    answers.shuffle();

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Column(
                  children: [
                    CardQuestion(
                      count: count,
                      level: id,
                      son1: list1[count],
                      son2: list2[count],
                      result: listResult[count],
                      onPressed: onPressed,
                      onTimeUp: onTimeUp,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),

            for (var answer in answers) answersButton(answer),
            const SizedBox(height: 120),
            SizedBox.shrink(),
            SizedBox(
              width: 300,
              height: 47,
              child: ButtonFooter(listScore: [wrong, correct]),
            ),

          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainAndBottomSheetColor,
      leading: IconButton(
        onPressed: () {
          myDialog(context);
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
      ),
    );
  }

  /// Javob tugmalari
  Padding answersButton(int answer) {
    //  answer=-1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: AppDimens.levelButtonWidth,
        height: AppDimens.levelButtonHeight,
        child: CustomButton(
          text: answer.toString(),
          color: AppColors.mainAndBottomSheetColor,
          textColor: AppColors.black,
          function: () {
            checkAnswer((answer.toString()));
          },
        ),
      ),
    );
  }
}
