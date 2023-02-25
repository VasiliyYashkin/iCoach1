// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealPlanStruct> _$mealPlanStructSerializer =
    new _$MealPlanStructSerializer();

class _$MealPlanStructSerializer
    implements StructuredSerializer<MealPlanStruct> {
  @override
  final Iterable<Type> types = const [MealPlanStruct, _$MealPlanStruct];
  @override
  final String wireName = 'MealPlanStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MealPlanStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.mealTrackingOn;
    if (value != null) {
      result
        ..add('meal_tracking_on')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.porteins;
    if (value != null) {
      result
        ..add('porteins')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fats;
    if (value != null) {
      result
        ..add('fats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carbs;
    if (value != null) {
      result
        ..add('carbs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.calories;
    if (value != null) {
      result
        ..add('calories')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.protPercentage;
    if (value != null) {
      result
        ..add('prot_percentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fatsPercentage;
    if (value != null) {
      result
        ..add('fats_percentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.carbsPercentage;
    if (value != null) {
      result
        ..add('carbs_percentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MealPlanStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealPlanStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meal_tracking_on':
          result.mealTrackingOn = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'porteins':
          result.porteins = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'fats':
          result.fats = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'carbs':
          result.carbs = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'calories':
          result.calories = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'prot_percentage':
          result.protPercentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fats_percentage':
          result.fatsPercentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'carbs_percentage':
          result.carbsPercentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$MealPlanStruct extends MealPlanStruct {
  @override
  final bool? mealTrackingOn;
  @override
  final double? porteins;
  @override
  final double? fats;
  @override
  final double? carbs;
  @override
  final int? calories;
  @override
  final int? protPercentage;
  @override
  final int? fatsPercentage;
  @override
  final int? carbsPercentage;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MealPlanStruct([void Function(MealPlanStructBuilder)? updates]) =>
      (new MealPlanStructBuilder()..update(updates))._build();

  _$MealPlanStruct._(
      {this.mealTrackingOn,
      this.porteins,
      this.fats,
      this.carbs,
      this.calories,
      this.protPercentage,
      this.fatsPercentage,
      this.carbsPercentage,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MealPlanStruct', 'firestoreUtilData');
  }

  @override
  MealPlanStruct rebuild(void Function(MealPlanStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealPlanStructBuilder toBuilder() =>
      new MealPlanStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealPlanStruct &&
        mealTrackingOn == other.mealTrackingOn &&
        porteins == other.porteins &&
        fats == other.fats &&
        carbs == other.carbs &&
        calories == other.calories &&
        protPercentage == other.protPercentage &&
        fatsPercentage == other.fatsPercentage &&
        carbsPercentage == other.carbsPercentage &&
        firestoreUtilData == other.firestoreUtilData;
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
                                $jc($jc(0, mealTrackingOn.hashCode),
                                    porteins.hashCode),
                                fats.hashCode),
                            carbs.hashCode),
                        calories.hashCode),
                    protPercentage.hashCode),
                fatsPercentage.hashCode),
            carbsPercentage.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MealPlanStruct')
          ..add('mealTrackingOn', mealTrackingOn)
          ..add('porteins', porteins)
          ..add('fats', fats)
          ..add('carbs', carbs)
          ..add('calories', calories)
          ..add('protPercentage', protPercentage)
          ..add('fatsPercentage', fatsPercentage)
          ..add('carbsPercentage', carbsPercentage)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MealPlanStructBuilder
    implements Builder<MealPlanStruct, MealPlanStructBuilder> {
  _$MealPlanStruct? _$v;

  bool? _mealTrackingOn;
  bool? get mealTrackingOn => _$this._mealTrackingOn;
  set mealTrackingOn(bool? mealTrackingOn) =>
      _$this._mealTrackingOn = mealTrackingOn;

  double? _porteins;
  double? get porteins => _$this._porteins;
  set porteins(double? porteins) => _$this._porteins = porteins;

  double? _fats;
  double? get fats => _$this._fats;
  set fats(double? fats) => _$this._fats = fats;

  double? _carbs;
  double? get carbs => _$this._carbs;
  set carbs(double? carbs) => _$this._carbs = carbs;

  int? _calories;
  int? get calories => _$this._calories;
  set calories(int? calories) => _$this._calories = calories;

  int? _protPercentage;
  int? get protPercentage => _$this._protPercentage;
  set protPercentage(int? protPercentage) =>
      _$this._protPercentage = protPercentage;

  int? _fatsPercentage;
  int? get fatsPercentage => _$this._fatsPercentage;
  set fatsPercentage(int? fatsPercentage) =>
      _$this._fatsPercentage = fatsPercentage;

  int? _carbsPercentage;
  int? get carbsPercentage => _$this._carbsPercentage;
  set carbsPercentage(int? carbsPercentage) =>
      _$this._carbsPercentage = carbsPercentage;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MealPlanStructBuilder() {
    MealPlanStruct._initializeBuilder(this);
  }

  MealPlanStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealTrackingOn = $v.mealTrackingOn;
      _porteins = $v.porteins;
      _fats = $v.fats;
      _carbs = $v.carbs;
      _calories = $v.calories;
      _protPercentage = $v.protPercentage;
      _fatsPercentage = $v.fatsPercentage;
      _carbsPercentage = $v.carbsPercentage;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealPlanStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MealPlanStruct;
  }

  @override
  void update(void Function(MealPlanStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MealPlanStruct build() => _build();

  _$MealPlanStruct _build() {
    final _$result = _$v ??
        new _$MealPlanStruct._(
            mealTrackingOn: mealTrackingOn,
            porteins: porteins,
            fats: fats,
            carbs: carbs,
            calories: calories,
            protPercentage: protPercentage,
            fatsPercentage: fatsPercentage,
            carbsPercentage: carbsPercentage,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MealPlanStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
