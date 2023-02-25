import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

DocumentReference stringUserIDToUserDocRef(String userID) {
  // Convert String user ID to User document reference
  return FirebaseFirestore.instance.collection('users').doc(userID);
}

double commaToDot(String stringData) {
  // check if weight contains coma, replace coma with dot, else return weight
  if (stringData.contains(',')) {
    return double.parse(stringData.replaceAll(',', '.'));
  }
  return double.parse(stringData);
}

double fatsAccordingToCalPercentage(
  int calories,
  int percentage,
) {
  // count calories according to entered percentage and than count protein quantity
  // count prot and carb according to entered percentage and then count calories per meal
  // if calories are less than zero, take big number (50000)
  if (calories >= 0) {
    double caloriesPercentage = calories * (percentage / 100);

    double resultProtein;
    return resultProtein = caloriesPercentage / 9;
  } else {
    return 0;
  }
}

double? howMuchFatsInCal(
  double caloriesQtty,
  double fatsQtty,
) {
  // count calories in protein qtty
  // count calories in protein qtty in Dart Language
  double? result = fatsQtty * 9 / caloriesQtty;
  return result * 100;
}

int? summIs100(
  int prot,
  int fat,
  int carb,
) {
  // count summ of arguments
  int? summ = prot + fat + carb;
  return summ;
}

double protAndCarbAccordingToCalPercentage(
  int calories,
  int percentage,
) {
  // count calories according to entered percentage and than count protein quantity
  // count prot and carb according to entered percentage and then count calories per meal
  // if calories are less than zero, take big number (50000)
  if (calories >= 0) {
    double caloriesPercentage = calories * (percentage / 100);

    double resultProtein;
    return resultProtein = caloriesPercentage / 4;
  } else {
    return 0;
  }
}

double? nutrientsToCalories(
  double? prot,
  double? fat,
  double? carb,
) {
  // How much calories in summ of Proteins Fats Carbs
  // count calories in summ of Proteins Fats Carbs
  double? result = prot! * 4 + fat! * 9 + carb! * 4;
  return result;
}

double? howMuchProtAndCarbInCal(
  double caloriesQtty,
  double protOrCarbQtty,
) {
  // count calories in protein qtty
  // count calories in protein qtty in Dart Language
  double? result = protOrCarbQtty * 4 / caloriesQtty;
  return result * 100;
}
