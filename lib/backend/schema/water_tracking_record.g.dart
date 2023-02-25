// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_tracking_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WaterTrackingRecord> _$waterTrackingRecordSerializer =
    new _$WaterTrackingRecordSerializer();

class _$WaterTrackingRecordSerializer
    implements StructuredSerializer<WaterTrackingRecord> {
  @override
  final Iterable<Type> types = const [
    WaterTrackingRecord,
    _$WaterTrackingRecord
  ];
  @override
  final String wireName = 'WaterTrackingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WaterTrackingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.waterFact;
    if (value != null) {
      result
        ..add('water_fact')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.waterPlanned;
    if (value != null) {
      result
        ..add('water_planned')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dateString;
    if (value != null) {
      result
        ..add('date_string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  WaterTrackingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WaterTrackingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'water_fact':
          result.waterFact = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'water_planned':
          result.waterPlanned = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'date_string':
          result.dateString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$WaterTrackingRecord extends WaterTrackingRecord {
  @override
  final DateTime? date;
  @override
  final int? waterFact;
  @override
  final int? waterPlanned;
  @override
  final String? dateString;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WaterTrackingRecord(
          [void Function(WaterTrackingRecordBuilder)? updates]) =>
      (new WaterTrackingRecordBuilder()..update(updates))._build();

  _$WaterTrackingRecord._(
      {this.date,
      this.waterFact,
      this.waterPlanned,
      this.dateString,
      this.ffRef})
      : super._();

  @override
  WaterTrackingRecord rebuild(
          void Function(WaterTrackingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WaterTrackingRecordBuilder toBuilder() =>
      new WaterTrackingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WaterTrackingRecord &&
        date == other.date &&
        waterFact == other.waterFact &&
        waterPlanned == other.waterPlanned &&
        dateString == other.dateString &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, date.hashCode), waterFact.hashCode),
                waterPlanned.hashCode),
            dateString.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WaterTrackingRecord')
          ..add('date', date)
          ..add('waterFact', waterFact)
          ..add('waterPlanned', waterPlanned)
          ..add('dateString', dateString)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WaterTrackingRecordBuilder
    implements Builder<WaterTrackingRecord, WaterTrackingRecordBuilder> {
  _$WaterTrackingRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  int? _waterFact;
  int? get waterFact => _$this._waterFact;
  set waterFact(int? waterFact) => _$this._waterFact = waterFact;

  int? _waterPlanned;
  int? get waterPlanned => _$this._waterPlanned;
  set waterPlanned(int? waterPlanned) => _$this._waterPlanned = waterPlanned;

  String? _dateString;
  String? get dateString => _$this._dateString;
  set dateString(String? dateString) => _$this._dateString = dateString;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WaterTrackingRecordBuilder() {
    WaterTrackingRecord._initializeBuilder(this);
  }

  WaterTrackingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _waterFact = $v.waterFact;
      _waterPlanned = $v.waterPlanned;
      _dateString = $v.dateString;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WaterTrackingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WaterTrackingRecord;
  }

  @override
  void update(void Function(WaterTrackingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WaterTrackingRecord build() => _build();

  _$WaterTrackingRecord _build() {
    final _$result = _$v ??
        new _$WaterTrackingRecord._(
            date: date,
            waterFact: waterFact,
            waterPlanned: waterPlanned,
            dateString: dateString,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
