import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'is_coach')
  bool? get isCoach;

  @BuiltValueField(wireName: 'coach_ref')
  DocumentReference? get coachRef;

  @BuiltValueField(wireName: 'widght_control1')
  BuiltList<String>? get widghtControl1;

  @BuiltValueField(wireName: 'measurements_control1')
  BuiltList<String>? get measurementsControl1;

  @BuiltValueField(wireName: 'photoes_control1')
  BuiltList<String>? get photoesControl1;

  BuiltList<String>? get measurmentsSwitch;

  @BuiltValueField(wireName: 'full_access')
  bool? get fullAccess;

  @BuiltValueField(wireName: 'water_tracking')
  bool? get waterTracking;

  @BuiltValueField(wireName: 'water_qtty')
  int? get waterQtty;

  @BuiltValueField(wireName: 'meal_tracking')
  MealPlanStruct get mealTracking;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..isCoach = false
    ..widghtControl1 = ListBuilder()
    ..measurementsControl1 = ListBuilder()
    ..photoesControl1 = ListBuilder()
    ..measurmentsSwitch = ListBuilder()
    ..fullAccess = false
    ..waterTracking = false
    ..waterQtty = 0
    ..mealTracking = MealPlanStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isCoach,
  DocumentReference? coachRef,
  bool? fullAccess,
  bool? waterTracking,
  int? waterQtty,
  MealPlanStruct? mealTracking,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..isCoach = isCoach
        ..coachRef = coachRef
        ..widghtControl1 = null
        ..measurementsControl1 = null
        ..photoesControl1 = null
        ..measurmentsSwitch = null
        ..fullAccess = fullAccess
        ..waterTracking = waterTracking
        ..waterQtty = waterQtty
        ..mealTracking = MealPlanStructBuilder(),
    ),
  );

  // Handle nested data for "meal_tracking" field.
  addMealPlanStructData(firestoreData, mealTracking, 'meal_tracking');

  return firestoreData;
}
