import 'package:flutter/material.dart';

import '../../pages/first_page.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/strings.dart';

void myDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 15,
        alignment: Alignment(0, 0),
        backgroundColor: AppColors.white,
        shadowColor: AppColors.black,
        child: Container(
          width: 372,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  AppTexts.attention,
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: AppDimens.d22,
                  ),
                ),
                const SizedBox(height: AppDimens.d22),
                const Text(
                  AppTexts.doYou,
                  style: TextStyle(color: AppColors.black),
                ),
                const SizedBox(height: AppDimens.d22),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {  Navigator. pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(builder: (BuildContext context) => const HomePage()),
                        ModalRoute. withName('/'),
                      );},
                      child: Text("Yes",style: TextStyle(color: AppColors.white),),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No",style: TextStyle(color: AppColors.white),),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}