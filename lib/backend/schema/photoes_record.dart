import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'photoes_record.g.dart';

abstract class PhotoesRecord
    implements Built<PhotoesRecord, PhotoesRecordBuilder> {
  static Serializer<PhotoesRecord> get serializer => _$photoesRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'Front')
  String? get front;

  @BuiltValueField(wireName: 'Side')
  String? get side;

  @BuiltValueField(wireName: 'Back')
  String? get back;

  @BuiltValueField(wireName: 'dropdown_date')
  String? get dropdownDate;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PhotoesRecordBuilder builder) => builder
    ..front = ''
    ..side = ''
    ..back = ''
    ..dropdownDate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Photoes')
          : FirebaseFirestore.instance.collectionGroup('Photoes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Photoes').doc();

  static Stream<PhotoesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PhotoesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PhotoesRecord._();
  factory PhotoesRecord([void Function(PhotoesRecordBuilder) updates]) =
      _$PhotoesRecord;

  static PhotoesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPhotoesRecordData({
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? front,
  String? side,
  String? back,
  String? dropdownDate,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    PhotoesRecord.serializer,
    PhotoesRecord(
      (p) => p
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..front = front
        ..side = side
        ..back = back
        ..dropdownDate = dropdownDate
        ..date = date,
    ),
  );

  return firestoreData;
}
