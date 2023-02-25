import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meal_tracking_record.g.dart';

abstract class MealTrackingRecord
    implements Built<MealTrackingRecord, MealTrackingRecordBuilder> {
  static Serializer<MealTrackingRecord> get serializer =>
      _$mealTrackingRecordSerializer;

  DateTime? get date;

  @BuiltValueField(wireName: 'date_string')
  String? get dateString;

  @BuiltValueField(wireName: 'prot_planned')
  double? get protPlanned;

  @BuiltValueField(wireName: 'prot_fact')
  double? get protFact;

  @BuiltValueField(wireName: 'carbs_planned')
  double? get carbsPlanned;

  @BuiltValueField(wireName: 'carbs_fact')
  double? get carbsFact;

  @BuiltValueField(wireName: 'calories_planned')
  double? get caloriesPlanned;

  @BuiltValueField(wireName: 'calories_fact')
  double? get caloriesFact;

  @BuiltValueField(wireName: 'fats_planned')
  double? get fatsPlanned;

  @BuiltValueField(wireName: 'fats_fact')
  double? get fatsFact;

  @BuiltValueField(wireName: 'prot_percentage')
  double? get protPercentage;

  @BuiltValueField(wireName: 'fats_percentage')
  double? get fatsPercentage;

  @BuiltValueField(wireName: 'carbs_percentage')
  double? get carbsPercentage;

  @BuiltValueField(wireName: 'prot_percentage_planned')
  double? get protPercentagePlanned;

  @BuiltValueField(wireName: 'fats_percentage_planned')
  double? get fatsPercentagePlanned;

  @BuiltValueField(wireName: 'carbs_percentage_planned')
  double? get carbsPercentagePlanned;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MealTrackingRecordBuilder builder) => builder
    ..dateString = ''
    ..protPlanned = 0.0
    ..protFact = 0.0
    ..carbsPlanned = 0.0
    ..carbsFact = 0.0
    ..caloriesPlanned = 0.0
    ..caloriesFact = 0.0
    ..fatsPlanned = 0.0
    ..fatsFact = 0.0
    ..protPercentage = 0.0
    ..fatsPercentage = 0.0
    ..carbsPercentage = 0.0
    ..protPercentagePlanned = 0.0
    ..fatsPercentagePlanned = 0.0
    ..carbsPercentagePlanned = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meal_tracking')
          : FirebaseFirestore.instance.collectionGroup('meal_tracking');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('meal_tracking').doc();

  static Stream<MealTrackingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MealTrackingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MealTrackingRecord._();
  factory MealTrackingRecord(
          [void Function(MealTrackingRecordBuilder) updates]) =
      _$MealTrackingRecord;

  static MealTrackingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMealTrackingRecordData({
  DateTime? date,
  String? dateString,
  double? protPlanned,
  double? protFact,
  double? carbsPlanned,
  double? carbsFact,
  double? caloriesPlanned,
  double? caloriesFact,
  double? fatsPlanned,
  double? fatsFact,
  double? protPercentage,
  double? fatsPercentage,
  double? carbsPercentage,
  double? protPercentagePlanned,
  double? fatsPercentagePlanned,
  double? carbsPercentagePlanned,
}) {
  final firestoreData = serializers.toFirestore(
    MealTrackingRecord.serializer,
    MealTrackingRecord(
      (m) => m
        ..date = date
        ..dateString = dateString
        ..protPlanned = protPlanned
        ..protFact = protFact
        ..carbsPlanned = carbsPlanned
        ..carbsFact = carbsFact
        ..caloriesPlanned = caloriesPlanned
        ..caloriesFact = caloriesFact
        ..fatsPlanned = fatsPlanned
        ..fatsFact = fatsFact
        ..protPercentage = protPercentage
        ..fatsPercentage = fatsPercentage
        ..carbsPercentage = carbsPercentage
        ..protPercentagePlanned = protPercentagePlanned
        ..fatsPercentagePlanned = fatsPercentagePlanned
        ..carbsPercentagePlanned = carbsPercentagePlanned,
    ),
  );

  return firestoreData;
}
