import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

sealed class AppTextStyle {
  static final TextStyle quizly = TextStyle(
    color: AppColors.white,
    fontSize: AppDimens.d66,
  );
}
