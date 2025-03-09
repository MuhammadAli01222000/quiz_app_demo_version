
import'package:flutter/material.dart';

sealed class  QuizController{
static String ratingSystem(int correct){
  String result="";

  if(correct>=0 && correct<6){
    result="Failed Try again";
  }
  if(correct>=6 && correct<7){
    result="Satisfactory Meets minimum requirements, but more work is needed";
  }
  if(correct>=7&& correct<9){
    result="Good result, few errors";
  }
  if(correct>9&& correct<=10){
    result="Success";
  }
return result;
}

}
