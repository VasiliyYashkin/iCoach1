// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_tracking_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealTrackingRecord> _$mealTrackingRecordSerializer =
    new _$MealTrackingRecordSerializer();

class _$MealTrackingRecordSerializer
    implements StructuredSerializer<MealTrackingRecord> {
  @override
  final Iterable<Type> types = const [MealTrackingRecord, _$MealTrackingRecord];
  @override
  final String wireName = 'MealTrackingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MealTrackingRecord object,
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
    value = object.dateString;
    if (value != null) {
      result
        ..add('date_string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.protPlanned;
    if (value != null) {
      result
        ..add('prot_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.protFact;
    if (value != null) {
      result
        ..add('prot_fact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbsPlanned;
    if (value != null) {
      result
        ..add('carbs_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbsFact;
    if (value != null) {
      result
        ..add('carbs_fact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.caloriesPlanned;
    if (value != null) {
      result
        ..add('calories_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.caloriesFact;
    if (value != null) {
      result
        ..add('calories_fact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fatsPlanned;
    if (value != null) {
      result
        ..add('fats_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fatsFact;
    if (value != null) {
      result
        ..add('fats_fact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.protPercentage;
    if (value != null) {
      result
        ..add('prot_percentage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fatsPercentage;
    if (value != null) {
      result
        ..add('fats_percentage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbsPercentage;
    if (value != null) {
      result
        ..add('carbs_percentage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.protPercentagePlanned;
    if (value != null) {
      result
        ..add('prot_percentage_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fatsPercentagePlanned;
    if (value != null) {
      result
        ..add('fats_percentage_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbsPercentagePlanned;
    if (value != null) {
      result
        ..add('carbs_percentage_planned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  MealTrackingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealTrackingRecordBuilder();

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
        case 'date_string':
          result.dateString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prot_planned':
          result.protPlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'prot_fact':
          result.protFact = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs_planned':
          result.carbsPlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs_fact':
          result.carbsFact = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'calories_planned':
          result.caloriesPlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'calories_fact':
          result.caloriesFact = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats_planned':
          result.fatsPlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats_fact':
          result.fatsFact = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'prot_percentage':
          result.protPercentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats_percentage':
          result.fatsPercentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs_percentage':
          result.carbsPercentage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'prot_percentage_planned':
          result.protPercentagePlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats_percentage_planned':
          result.fatsPercentagePlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs_percentage_planned':
          result.carbsPercentagePlanned = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$MealTrackingRecord extends MealTrackingRecord {
  @override
  final DateTime? date;
  @override
  final String? dateString;
  @override
  final double? protPlanned;
  @override
  final double? protFact;
  @override
  final double? carbsPlanned;
  @override
  final double? carbsFact;
  @override
  final double? caloriesPlanned;
  @override
  final double? caloriesFact;
  @override
  final double? fatsPlanned;
  @override
  final double? fatsFact;
  @override
  final double? protPercentage;
  @override
  final double? fatsPercentage;
  @override
  final double? carbsPercentage;
  @override
  final double? protPercentagePlanned;
  @override
  final double? fatsPercentagePlanned;
  @override
  final double? carbsPercentagePlanned;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MealTrackingRecord(
          [void Function(MealTrackingRecordBuilder)? updates]) =>
      (new MealTrackingRecordBuilder()..update(updates))._build();

  _$MealTrackingRecord._(
      {this.date,
      this.dateString,
      this.protPlanned,
      this.protFact,
      this.carbsPlanned,
      this.carbsFact,
      this.caloriesPlanned,
      this.caloriesFact,
      this.fatsPlanned,
      this.fatsFact,
      this.protPercentage,
      this.fatsPercentage,
      this.carbsPercentage,
      this.protPercentagePlanned,
      this.fatsPercentagePlanned,
      this.carbsPercentagePlanned,
      this.ffRef})
      : super._();

  @override
  MealTrackingRecord rebuild(
          void Function(MealTrackingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealTrackingRecordBuilder toBuilder() =>
      new MealTrackingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealTrackingRecord &&
        date == other.date &&
        dateString == other.dateString &&
        protPlanned == other.protPlanned &&
        protFact == other.protFact &&
        carbsPlanned == other.carbsPlanned &&
        carbsFact == other.carbsFact &&
        caloriesPlanned == other.caloriesPlanned &&
        caloriesFact == other.caloriesFact &&
        fatsPlanned == other.fatsPlanned &&
        fatsFact == other.fatsFact &&
        protPercentage == other.protPercentage &&
        fatsPercentage == other.fatsPercentage &&
        carbsPercentage == other.carbsPercentage &&
        protPercentagePlanned == other.protPercentagePlanned &&
        fatsPercentagePlanned == other.fatsPercentagePlanned &&
        carbsPercentagePlanned == other.carbsPercentagePlanned &&
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
                                                                        date
                                                                            .hashCode),
                                                                    dateString
                                                                        .hashCode),
                                                                protPlanned
                                                                    .hashCode),
                                                            protFact.hashCode),
                                                        carbsPlanned.hashCode),
                                                    carbsFact.hashCode),
                                                caloriesPlanned.hashCode),
                                            caloriesFact.hashCode),
                                        fatsPlanned.hashCode),
                                    fatsFact.hashCode),
                                protPercentage.hashCode),
                            fatsPercentage.hashCode),
                        carbsPercentage.hashCode),
                    protPercentagePlanned.hashCode),
                fatsPercentagePlanned.hashCode),
            carbsPercentagePlanned.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MealTrackingRecord')
          ..add('date', date)
          ..add('dateString', dateString)
          ..add('protPlanned', protPlanned)
          ..add('protFact', protFact)
          ..add('carbsPlanned', carbsPlanned)
          ..add('carbsFact', carbsFact)
          ..add('caloriesPlanned', caloriesPlanned)
          ..add('caloriesFact', caloriesFact)
          ..add('fatsPlanned', fatsPlanned)
          ..add('fatsFact', fatsFact)
          ..add('protPercentage', protPercentage)
          ..add('fatsPercentage', fatsPercentage)
          ..add('carbsPercentage', carbsPercentage)
          ..add('protPercentagePlanned', protPercentagePlanned)
          ..add('fatsPercentagePlanned', fatsPercentagePlanned)
          ..add('carbsPercentagePlanned', carbsPercentagePlanned)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MealTrackingRecordBuilder
    implements Builder<MealTrackingRecord, MealTrackingRecordBuilder> {
  _$MealTrackingRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _dateString;
  String? get dateString => _$this._dateString;
  set dateString(String? dateString) => _$this._dateString = dateString;

  double? _protPlanned;
  double? get protPlanned => _$this._protPlanned;
  set protPlanned(double? protPlanned) => _$this._protPlanned = protPlanned;

  double? _protFact;
  double? get protFact => _$this._protFact;
  set protFact(double? protFact) => _$this._protFact = protFact;

  double? _carbsPlanned;
  double? get carbsPlanned => _$this._carbsPlanned;
  set carbsPlanned(double? carbsPlanned) => _$this._carbsPlanned = carbsPlanned;

  double? _carbsFact;
  double? get carbsFact => _$this._carbsFact;
  set carbsFact(double? carbsFact) => _$this._carbsFact = carbsFact;

  double? _caloriesPlanned;
  double? get caloriesPlanned => _$this._caloriesPlanned;
  set caloriesPlanned(double? caloriesPlanned) =>
      _$this._caloriesPlanned = caloriesPlanned;

  double? _caloriesFact;
  double? get caloriesFact => _$this._caloriesFact;
  set caloriesFact(double? caloriesFact) => _$this._caloriesFact = caloriesFact;

  double? _fatsPlanned;
  double? get fatsPlanned => _$this._fatsPlanned;
  set fatsPlanned(double? fatsPlanned) => _$this._fatsPlanned = fatsPlanned;

  double? _fatsFact;
  double? get fatsFact => _$this._fatsFact;
  set fatsFact(double? fatsFact) => _$this._fatsFact = fatsFact;

  double? _protPercentage;
  double? get protPercentage => _$this._protPercentage;
  set protPercentage(double? protPercentage) =>
      _$this._protPercentage = protPercentage;

  double? _fatsPercentage;
  double? get fatsPercentage => _$this._fatsPercentage;
  set fatsPercentage(double? fatsPercentage) =>
      _$this._fatsPercentage = fatsPercentage;

  double? _carbsPercentage;
  double? get carbsPercentage => _$this._carbsPercentage;
  set carbsPercentage(double? carbsPercentage) =>
      _$this._carbsPercentage = carbsPercentage;

  double? _protPercentagePlanned;
  double? get protPercentagePlanned => _$this._protPercentagePlanned;
  set protPercentagePlanned(double? protPercentagePlanned) =>
      _$this._protPercentagePlanned = protPercentagePlanned;

  double? _fatsPercentagePlanned;
  double? get fatsPercentagePlanned => _$this._fatsPercentagePlanned;
  set fatsPercentagePlanned(double? fatsPercentagePlanned) =>
      _$this._fatsPercentagePlanned = fatsPercentagePlanned;

  double? _carbsPercentagePlanned;
  double? get carbsPercentagePlanned => _$this._carbsPercentagePlanned;
  set carbsPercentagePlanned(double? carbsPercentagePlanned) =>
      _$this._carbsPercentagePlanned = carbsPercentagePlanned;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MealTrackingRecordBuilder() {
    MealTrackingRecord._initializeBuilder(this);
  }

  MealTrackingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _dateString = $v.dateString;
      _protPlanned = $v.protPlanned;
      _protFact = $v.protFact;
      _carbsPlanned = $v.carbsPlanned;
      _carbsFact = $v.carbsFact;
      _caloriesPlanned = $v.caloriesPlanned;
      _caloriesFact = $v.caloriesFact;
      _fatsPlanned = $v.fatsPlanned;
      _fatsFact = $v.fatsFact;
      _protPercentage = $v.protPercentage;
      _fatsPercentage = $v.fatsPercentage;
      _carbsPercentage = $v.carbsPercentage;
      _protPercentagePlanned = $v.protPercentagePlanned;
      _fatsPercentagePlanned = $v.fatsPercentagePlanned;
      _carbsPercentagePlanned = $v.carbsPercentagePlanned;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealTrackingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MealTrackingRecord;
  }

  @override
  void update(void Function(MealTrackingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MealTrackingRecord build() => _build();

  _$MealTrackingRecord _build() {
    final _$result = _$v ??
        new _$MealTrackingRecord._(
            date: date,
            dateString: dateString,
            protPlanned: protPlanned,
            protFact: protFact,
            carbsPlanned: carbsPlanned,
            carbsFact: carbsFact,
            caloriesPlanned: caloriesPlanned,
            caloriesFact: caloriesFact,
            fatsPlanned: fatsPlanned,
            fatsFact: fatsFact,
            protPercentage: protPercentage,
            fatsPercentage: fatsPercentage,
            carbsPercentage: carbsPercentage,
            protPercentagePlanned: protPercentagePlanned,
            fatsPercentagePlanned: fatsPercentagePlanned,
            carbsPercentagePlanned: carbsPercentagePlanned,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
