// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurements_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MeasurementsRecord> _$measurementsRecordSerializer =
    new _$MeasurementsRecordSerializer();

class _$MeasurementsRecordSerializer
    implements StructuredSerializer<MeasurementsRecord> {
  @override
  final Iterable<Type> types = const [MeasurementsRecord, _$MeasurementsRecord];
  @override
  final String wireName = 'MeasurementsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MeasurementsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.chest;
    if (value != null) {
      result
        ..add('chest')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.waist;
    if (value != null) {
      result
        ..add('waist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hips;
    if (value != null) {
      result
        ..add('hips')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hipLeft;
    if (value != null) {
      result
        ..add('hip_left')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hipRight;
    if (value != null) {
      result
        ..add('hip_right')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.bicepsLeft;
    if (value != null) {
      result
        ..add('biceps_left')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.bicepsRight;
    if (value != null) {
      result
        ..add('biceps_right')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shinLeft;
    if (value != null) {
      result
        ..add('shin_left')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shinRight;
    if (value != null) {
      result
        ..add('shin_right')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dropdownDate;
    if (value != null) {
      result
        ..add('dropdown_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  MeasurementsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MeasurementsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'chest':
          result.chest = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'waist':
          result.waist = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'hips':
          result.hips = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'hip_left':
          result.hipLeft = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'hip_right':
          result.hipRight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'biceps_left':
          result.bicepsLeft = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'biceps_right':
          result.bicepsRight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'shin_left':
          result.shinLeft = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'shin_right':
          result.shinRight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'dropdown_date':
          result.dropdownDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$MeasurementsRecord extends MeasurementsRecord {
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final double? chest;
  @override
  final double? waist;
  @override
  final double? hips;
  @override
  final double? hipLeft;
  @override
  final double? hipRight;
  @override
  final double? bicepsLeft;
  @override
  final double? bicepsRight;
  @override
  final double? shinLeft;
  @override
  final double? shinRight;
  @override
  final String? dropdownDate;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MeasurementsRecord(
          [void Function(MeasurementsRecordBuilder)? updates]) =>
      (new MeasurementsRecordBuilder()..update(updates))._build();

  _$MeasurementsRecord._(
      {this.createdAt,
      this.createdBy,
      this.chest,
      this.waist,
      this.hips,
      this.hipLeft,
      this.hipRight,
      this.bicepsLeft,
      this.bicepsRight,
      this.shinLeft,
      this.shinRight,
      this.dropdownDate,
      this.date,
      this.ffRef})
      : super._();

  @override
  MeasurementsRecord rebuild(
          void Function(MeasurementsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeasurementsRecordBuilder toBuilder() =>
      new MeasurementsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeasurementsRecord &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        chest == other.chest &&
        waist == other.waist &&
        hips == other.hips &&
        hipLeft == other.hipLeft &&
        hipRight == other.hipRight &&
        bicepsLeft == other.bicepsLeft &&
        bicepsRight == other.bicepsRight &&
        shinLeft == other.shinLeft &&
        shinRight == other.shinRight &&
        dropdownDate == other.dropdownDate &&
        date == other.date &&
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
                                                        $jc(0,
                                                            createdAt.hashCode),
                                                        createdBy.hashCode),
                                                    chest.hashCode),
                                                waist.hashCode),
                                            hips.hashCode),
                                        hipLeft.hashCode),
                                    hipRight.hashCode),
                                bicepsLeft.hashCode),
                            bicepsRight.hashCode),
                        shinLeft.hashCode),
                    shinRight.hashCode),
                dropdownDate.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeasurementsRecord')
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('chest', chest)
          ..add('waist', waist)
          ..add('hips', hips)
          ..add('hipLeft', hipLeft)
          ..add('hipRight', hipRight)
          ..add('bicepsLeft', bicepsLeft)
          ..add('bicepsRight', bicepsRight)
          ..add('shinLeft', shinLeft)
          ..add('shinRight', shinRight)
          ..add('dropdownDate', dropdownDate)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MeasurementsRecordBuilder
    implements Builder<MeasurementsRecord, MeasurementsRecordBuilder> {
  _$MeasurementsRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  double? _chest;
  double? get chest => _$this._chest;
  set chest(double? chest) => _$this._chest = chest;

  double? _waist;
  double? get waist => _$this._waist;
  set waist(double? waist) => _$this._waist = waist;

  double? _hips;
  double? get hips => _$this._hips;
  set hips(double? hips) => _$this._hips = hips;

  double? _hipLeft;
  double? get hipLeft => _$this._hipLeft;
  set hipLeft(double? hipLeft) => _$this._hipLeft = hipLeft;

  double? _hipRight;
  double? get hipRight => _$this._hipRight;
  set hipRight(double? hipRight) => _$this._hipRight = hipRight;

  double? _bicepsLeft;
  double? get bicepsLeft => _$this._bicepsLeft;
  set bicepsLeft(double? bicepsLeft) => _$this._bicepsLeft = bicepsLeft;

  double? _bicepsRight;
  double? get bicepsRight => _$this._bicepsRight;
  set bicepsRight(double? bicepsRight) => _$this._bicepsRight = bicepsRight;

  double? _shinLeft;
  double? get shinLeft => _$this._shinLeft;
  set shinLeft(double? shinLeft) => _$this._shinLeft = shinLeft;

  double? _shinRight;
  double? get shinRight => _$this._shinRight;
  set shinRight(double? shinRight) => _$this._shinRight = shinRight;

  String? _dropdownDate;
  String? get dropdownDate => _$this._dropdownDate;
  set dropdownDate(String? dropdownDate) => _$this._dropdownDate = dropdownDate;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MeasurementsRecordBuilder() {
    MeasurementsRecord._initializeBuilder(this);
  }

  MeasurementsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _chest = $v.chest;
      _waist = $v.waist;
      _hips = $v.hips;
      _hipLeft = $v.hipLeft;
      _hipRight = $v.hipRight;
      _bicepsLeft = $v.bicepsLeft;
      _bicepsRight = $v.bicepsRight;
      _shinLeft = $v.shinLeft;
      _shinRight = $v.shinRight;
      _dropdownDate = $v.dropdownDate;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeasurementsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeasurementsRecord;
  }

  @override
  void update(void Function(MeasurementsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeasurementsRecord build() => _build();

  _$MeasurementsRecord _build() {
    final _$result = _$v ??
        new _$MeasurementsRecord._(
            createdAt: createdAt,
            createdBy: createdBy,
            chest: chest,
            waist: waist,
            hips: hips,
            hipLeft: hipLeft,
            hipRight: hipRight,
            bicepsLeft: bicepsLeft,
            bicepsRight: bicepsRight,
            shinLeft: shinLeft,
            shinRight: shinRight,
            dropdownDate: dropdownDate,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
