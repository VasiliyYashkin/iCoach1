import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'measurements_record.g.dart';

abstract class MeasurementsRecord
    implements Built<MeasurementsRecord, MeasurementsRecordBuilder> {
  static Serializer<MeasurementsRecord> get serializer =>
      _$measurementsRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  double? get chest;

  double? get waist;

  double? get hips;

  @BuiltValueField(wireName: 'hip_left')
  double? get hipLeft;

  @BuiltValueField(wireName: 'hip_right')
  double? get hipRight;

  @BuiltValueField(wireName: 'biceps_left')
  double? get bicepsLeft;

  @BuiltValueField(wireName: 'biceps_right')
  double? get bicepsRight;

  @BuiltValueField(wireName: 'shin_left')
  double? get shinLeft;

  @BuiltValueField(wireName: 'shin_right')
  double? get shinRight;

  @BuiltValueField(wireName: 'dropdown_date')
  String? get dropdownDate;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MeasurementsRecordBuilder builder) => builder
    ..chest = 0.0
    ..waist = 0.0
    ..hips = 0.0
    ..hipLeft = 0.0
    ..hipRight = 0.0
    ..bicepsLeft = 0.0
    ..bicepsRight = 0.0
    ..shinLeft = 0.0
    ..shinRight = 0.0
    ..dropdownDate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Measurements')
          : FirebaseFirestore.instance.collectionGroup('Measurements');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Measurements').doc();

  static Stream<MeasurementsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MeasurementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MeasurementsRecord._();
  factory MeasurementsRecord(
          [void Function(MeasurementsRecordBuilder) updates]) =
      _$MeasurementsRecord;

  static MeasurementsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMeasurementsRecordData({
  DateTime? createdAt,
  DocumentReference? createdBy,
  double? chest,
  double? waist,
  double? hips,
  double? hipLeft,
  double? hipRight,
  double? bicepsLeft,
  double? bicepsRight,
  double? shinLeft,
  double? shinRight,
  String? dropdownDate,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    MeasurementsRecord.serializer,
    MeasurementsRecord(
      (m) => m
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..chest = chest
        ..waist = waist
        ..hips = hips
        ..hipLeft = hipLeft
        ..hipRight = hipRight
        ..bicepsLeft = bicepsLeft
        ..bicepsRight = bicepsRight
        ..shinLeft = shinLeft
        ..shinRight = shinRight
        ..dropdownDate = dropdownDate
        ..date = date,
    ),
  );

  return firestoreData;
}
