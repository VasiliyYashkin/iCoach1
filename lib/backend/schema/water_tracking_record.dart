import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'water_tracking_record.g.dart';

abstract class WaterTrackingRecord
    implements Built<WaterTrackingRecord, WaterTrackingRecordBuilder> {
  static Serializer<WaterTrackingRecord> get serializer =>
      _$waterTrackingRecordSerializer;

  DateTime? get date;

  @BuiltValueField(wireName: 'water_fact')
  int? get waterFact;

  @BuiltValueField(wireName: 'water_planned')
  int? get waterPlanned;

  @BuiltValueField(wireName: 'date_string')
  String? get dateString;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(WaterTrackingRecordBuilder builder) => builder
    ..waterFact = 0
    ..waterPlanned = 0
    ..dateString = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('water_tracking')
          : FirebaseFirestore.instance.collectionGroup('water_tracking');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('water_tracking').doc();

  static Stream<WaterTrackingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WaterTrackingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WaterTrackingRecord._();
  factory WaterTrackingRecord(
          [void Function(WaterTrackingRecordBuilder) updates]) =
      _$WaterTrackingRecord;

  static WaterTrackingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWaterTrackingRecordData({
  DateTime? date,
  int? waterFact,
  int? waterPlanned,
  String? dateString,
}) {
  final firestoreData = serializers.toFirestore(
    WaterTrackingRecord.serializer,
    WaterTrackingRecord(
      (w) => w
        ..date = date
        ..waterFact = waterFact
        ..waterPlanned = waterPlanned
        ..dateString = dateString,
    ),
  );

  return firestoreData;
}
