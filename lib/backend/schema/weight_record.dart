import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'weight_record.g.dart';

abstract class WeightRecord
    implements Built<WeightRecord, WeightRecordBuilder> {
  static Serializer<WeightRecord> get serializer => _$weightRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  double? get weight;

  DateTime? get date;

  @BuiltValueField(wireName: 'dropdown_date')
  String? get dropdownDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(WeightRecordBuilder builder) => builder
    ..weight = 0.0
    ..dropdownDate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('weight')
          : FirebaseFirestore.instance.collectionGroup('weight');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('weight').doc();

  static Stream<WeightRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WeightRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WeightRecord._();
  factory WeightRecord([void Function(WeightRecordBuilder) updates]) =
      _$WeightRecord;

  static WeightRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWeightRecordData({
  DateTime? createdAt,
  DocumentReference? createdBy,
  double? weight,
  DateTime? date,
  String? dropdownDate,
}) {
  final firestoreData = serializers.toFirestore(
    WeightRecord.serializer,
    WeightRecord(
      (w) => w
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..weight = weight
        ..date = date
        ..dropdownDate = dropdownDate,
    ),
  );

  return firestoreData;
}
