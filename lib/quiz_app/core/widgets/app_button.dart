import 'package:flutter/material.dart';
import 'package:git_and_gitlab/quiz_app/pages/first_page.dart';
import '../../pages/third_page.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/strings.dart';
import 'package:just_audio/just_audio.dart';

/// button uchun wiget
class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback function;

  const CustomButton({
    super.key,
    required this.text,
    required this.function,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        side: BorderSide(color: color, width: AppDimens.d2),
      ),
      onPressed: function,
      child: Center(child: Text(text, style: TextStyle(color: textColor))),
    );
  }
}

class ButtonFooter extends StatefulWidget {
  final List<int> listScore;
  const ButtonFooter({super.key, required this.listScore});

  @override
  _ButtonFooterState createState() => _ButtonFooterState();
}

class _ButtonFooterState extends State<ButtonFooter> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      const soundPath = "asset/sound/ringtone.wav";

      await _audioPlayer.setFilePath(soundPath);
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    final correct=widget.listScore[1];
    final wrong=widget.listScore[0];
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.mainAndBottomSheetColor,
        ),
      ),
      onPressed: () {
        _audioPlayer.play();
        Navigator. pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) =>  ThirdPage(list: [wrong,correct],)),
          ModalRoute. withName('/'),
        );      },
      child: Text(AppTexts.score, style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold)),
    );
  }
}

IconButton arrowBackButton(BuildContext context) => IconButton(
  icon: Icon(Icons.arrow_back, color: AppColors.white),
  onPressed: () {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
      ModalRoute.withName('/'),
    );
  },
);

///circle 3 - pagedagi

class GreenCircle extends StatelessWidget {
  const GreenCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ColoredBox(
        color: AppColors.green,
        child: SizedBox(width: AppDimens.d15, height: AppDimens.d15),
      ),
    );
  }
}

class RedCircle extends StatelessWidget {
  const RedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: ColoredBox(
        color: AppColors.red,
        child: SizedBox(width: AppDimens.d15, height: AppDimens.d15),
      ),
    );
  }
}
