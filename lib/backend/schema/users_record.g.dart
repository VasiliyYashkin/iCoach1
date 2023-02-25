// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meal_tracking',
      serializers.serialize(object.mealTracking,
          specifiedType: const FullType(MealPlanStruct)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isCoach;
    if (value != null) {
      result
        ..add('is_coach')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.coachRef;
    if (value != null) {
      result
        ..add('coach_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.widghtControl1;
    if (value != null) {
      result
        ..add('widght_control1')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.measurementsControl1;
    if (value != null) {
      result
        ..add('measurements_control1')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.photoesControl1;
    if (value != null) {
      result
        ..add('photoes_control1')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.measurmentsSwitch;
    if (value != null) {
      result
        ..add('measurmentsSwitch')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.fullAccess;
    if (value != null) {
      result
        ..add('full_access')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.waterTracking;
    if (value != null) {
      result
        ..add('water_tracking')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.waterQtty;
    if (value != null) {
      result
        ..add('water_qtty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_coach':
          result.isCoach = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'coach_ref':
          result.coachRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'widght_control1':
          result.widghtControl1.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'measurements_control1':
          result.measurementsControl1.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'photoes_control1':
          result.photoesControl1.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'measurmentsSwitch':
          result.measurmentsSwitch.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'full_access':
          result.fullAccess = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'water_tracking':
          result.waterTracking = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'water_qtty':
          result.waterQtty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'meal_tracking':
          result.mealTracking.replace(serializers.deserialize(value,
                  specifiedType: const FullType(MealPlanStruct))!
              as MealPlanStruct);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final bool? isCoach;
  @override
  final DocumentReference<Object?>? coachRef;
  @override
  final BuiltList<String>? widghtControl1;
  @override
  final BuiltList<String>? measurementsControl1;
  @override
  final BuiltList<String>? photoesControl1;
  @override
  final BuiltList<String>? measurmentsSwitch;
  @override
  final bool? fullAccess;
  @override
  final bool? waterTracking;
  @override
  final int? waterQtty;
  @override
  final MealPlanStruct mealTracking;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.isCoach,
      this.coachRef,
      this.widghtControl1,
      this.measurementsControl1,
      this.photoesControl1,
      this.measurmentsSwitch,
      this.fullAccess,
      this.waterTracking,
      this.waterQtty,
      required this.mealTracking,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        mealTracking, r'UsersRecord', 'mealTracking');
  }

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        isCoach == other.isCoach &&
        coachRef == other.coachRef &&
        widghtControl1 == other.widghtControl1 &&
        measurementsControl1 == other.measurementsControl1 &&
        photoesControl1 == other.photoesControl1 &&
        measurmentsSwitch == other.measurmentsSwitch &&
        fullAccess == other.fullAccess &&
        waterTracking == other.waterTracking &&
        waterQtty == other.waterQtty &&
        mealTracking == other.mealTracking &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        email
                                                                            .hashCode),
                                                                    displayName
                                                                        .hashCode),
                                                                photoUrl
                                                                    .hashCode),
                                                            uid.hashCode),
                                                        createdTime.hashCode),
                                                    phoneNumber.hashCode),
                                                isCoach.hashCode),
                                            coachRef.hashCode),
                                        widghtControl1.hashCode),
                                    measurementsControl1.hashCode),
                                photoesControl1.hashCode),
                            measurmentsSwitch.hashCode),
                        fullAccess.hashCode),
                    waterTracking.hashCode),
                waterQtty.hashCode),
            mealTracking.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('isCoach', isCoach)
          ..add('coachRef', coachRef)
          ..add('widghtControl1', widghtControl1)
          ..add('measurementsControl1', measurementsControl1)
          ..add('photoesControl1', photoesControl1)
          ..add('measurmentsSwitch', measurmentsSwitch)
          ..add('fullAccess', fullAccess)
          ..add('waterTracking', waterTracking)
          ..add('waterQtty', waterQtty)
          ..add('mealTracking', mealTracking)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _isCoach;
  bool? get isCoach => _$this._isCoach;
  set isCoach(bool? isCoach) => _$this._isCoach = isCoach;

  DocumentReference<Object?>? _coachRef;
  DocumentReference<Object?>? get coachRef => _$this._coachRef;
  set coachRef(DocumentReference<Object?>? coachRef) =>
      _$this._coachRef = coachRef;

  ListBuilder<String>? _widghtControl1;
  ListBuilder<String> get widghtControl1 =>
      _$this._widghtControl1 ??= new ListBuilder<String>();
  set widghtControl1(ListBuilder<String>? widghtControl1) =>
      _$this._widghtControl1 = widghtControl1;

  ListBuilder<String>? _measurementsControl1;
  ListBuilder<String> get measurementsControl1 =>
      _$this._measurementsControl1 ??= new ListBuilder<String>();
  set measurementsControl1(ListBuilder<String>? measurementsControl1) =>
      _$this._measurementsControl1 = measurementsControl1;

  ListBuilder<String>? _photoesControl1;
  ListBuilder<String> get photoesControl1 =>
      _$this._photoesControl1 ??= new ListBuilder<String>();
  set photoesControl1(ListBuilder<String>? photoesControl1) =>
      _$this._photoesControl1 = photoesControl1;

  ListBuilder<String>? _measurmentsSwitch;
  ListBuilder<String> get measurmentsSwitch =>
      _$this._measurmentsSwitch ??= new ListBuilder<String>();
  set measurmentsSwitch(ListBuilder<String>? measurmentsSwitch) =>
      _$this._measurmentsSwitch = measurmentsSwitch;

  bool? _fullAccess;
  bool? get fullAccess => _$this._fullAccess;
  set fullAccess(bool? fullAccess) => _$this._fullAccess = fullAccess;

  bool? _waterTracking;
  bool? get waterTracking => _$this._waterTracking;
  set waterTracking(bool? waterTracking) =>
      _$this._waterTracking = waterTracking;

  int? _waterQtty;
  int? get waterQtty => _$this._waterQtty;
  set waterQtty(int? waterQtty) => _$this._waterQtty = waterQtty;

  MealPlanStructBuilder? _mealTracking;
  MealPlanStructBuilder get mealTracking =>
      _$this._mealTracking ??= new MealPlanStructBuilder();
  set mealTracking(MealPlanStructBuilder? mealTracking) =>
      _$this._mealTracking = mealTracking;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _isCoach = $v.isCoach;
      _coachRef = $v.coachRef;
      _widghtControl1 = $v.widghtControl1?.toBuilder();
      _measurementsControl1 = $v.measurementsControl1?.toBuilder();
      _photoesControl1 = $v.photoesControl1?.toBuilder();
      _measurmentsSwitch = $v.measurmentsSwitch?.toBuilder();
      _fullAccess = $v.fullAccess;
      _waterTracking = $v.waterTracking;
      _waterQtty = $v.waterQtty;
      _mealTracking = $v.mealTracking.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              isCoach: isCoach,
              coachRef: coachRef,
              widghtControl1: _widghtControl1?.build(),
              measurementsControl1: _measurementsControl1?.build(),
              photoesControl1: _photoesControl1?.build(),
              measurmentsSwitch: _measurmentsSwitch?.build(),
              fullAccess: fullAccess,
              waterTracking: waterTracking,
              waterQtty: waterQtty,
              mealTracking: mealTracking.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'widghtControl1';
        _widghtControl1?.build();
        _$failedField = 'measurementsControl1';
        _measurementsControl1?.build();
        _$failedField = 'photoesControl1';
        _photoesControl1?.build();
        _$failedField = 'measurmentsSwitch';
        _measurmentsSwitch?.build();

        _$failedField = 'mealTracking';
        mealTracking.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
