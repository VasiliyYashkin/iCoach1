import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'meal_plan_struct.g.dart';

abstract class MealPlanStruct
    implements Built<MealPlanStruct, MealPlanStructBuilder> {
  static Serializer<MealPlanStruct> get serializer =>
      _$mealPlanStructSerializer;

  @BuiltValueField(wireName: 'meal_tracking_on')
  bool? get mealTrackingOn;

  double? get porteins;

  double? get fats;

  double? get carbs;

  int? get calories;

  @BuiltValueField(wireName: 'prot_percentage')
  int? get protPercentage;

  @BuiltValueField(wireName: 'fats_percentage')
  int? get fatsPercentage;

  @BuiltValueField(wireName: 'carbs_percentage')
  int? get carbsPercentage;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MealPlanStructBuilder builder) => builder
    ..mealTrackingOn = false
    ..porteins = 0.0
    ..fats = 0.0
    ..carbs = 0.0
    ..calories = 0
    ..protPercentage = 0
    ..fatsPercentage = 0
    ..carbsPercentage = 0
    ..firestoreUtilData = FirestoreUtilData();

  MealPlanStruct._();
  factory MealPlanStruct([void Function(MealPlanStructBuilder) updates]) =
      _$MealPlanStruct;
}

MealPlanStruct createMealPlanStruct({
  bool? mealTrackingOn,
  double? porteins,
  double? fats,
  double? carbs,
  int? calories,
  int? protPercentage,
  int? fatsPercentage,
  int? carbsPercentage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MealPlanStruct(
      (m) => m
        ..mealTrackingOn = mealTrackingOn
        ..porteins = porteins
        ..fats = fats
        ..carbs = carbs
        ..calories = calories
        ..protPercentage = protPercentage
        ..fatsPercentage = fatsPercentage
        ..carbsPercentage = carbsPercentage
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MealPlanStruct? updateMealPlanStruct(
  MealPlanStruct? mealPlan, {
  bool clearUnsetFields = true,
}) =>
    mealPlan != null
        ? (mealPlan.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMealPlanStructData(
  Map<String, dynamic> firestoreData,
  MealPlanStruct? mealPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mealPlan == null) {
    return;
  }
  if (mealPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && mealPlan.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mealPlanData = getMealPlanFirestoreData(mealPlan, forFieldValue);
  final nestedData = mealPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = mealPlan.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMealPlanFirestoreData(
  MealPlanStruct? mealPlan, [
  bool forFieldValue = false,
]) {
  if (mealPlan == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MealPlanStruct.serializer, mealPlan);

  // Add any Firestore field values
  mealPlan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMealPlanListFirestoreData(
  List<MealPlanStruct>? mealPlans,
) =>
    mealPlans?.map((m) => getMealPlanFirestoreData(m, true)).toList() ?? [];
