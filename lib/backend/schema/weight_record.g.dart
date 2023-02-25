// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeightRecord> _$weightRecordSerializer =
    new _$WeightRecordSerializer();

class _$WeightRecordSerializer implements StructuredSerializer<WeightRecord> {
  @override
  final Iterable<Type> types = const [WeightRecord, _$WeightRecord];
  @override
  final String wireName = 'WeightRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeightRecord object,
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
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dropdownDate;
    if (value != null) {
      result
        ..add('dropdown_date')
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
  WeightRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeightRecordBuilder();

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
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dropdown_date':
          result.dropdownDate = serializers.deserialize(value,
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

class _$WeightRecord extends WeightRecord {
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final double? weight;
  @override
  final DateTime? date;
  @override
  final String? dropdownDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WeightRecord([void Function(WeightRecordBuilder)? updates]) =>
      (new WeightRecordBuilder()..update(updates))._build();

  _$WeightRecord._(
      {this.createdAt,
      this.createdBy,
      this.weight,
      this.date,
      this.dropdownDate,
      this.ffRef})
      : super._();

  @override
  WeightRecord rebuild(void Function(WeightRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeightRecordBuilder toBuilder() => new WeightRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeightRecord &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        weight == other.weight &&
        date == other.date &&
        dropdownDate == other.dropdownDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, createdAt.hashCode), createdBy.hashCode),
                    weight.hashCode),
                date.hashCode),
            dropdownDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeightRecord')
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('weight', weight)
          ..add('date', date)
          ..add('dropdownDate', dropdownDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WeightRecordBuilder
    implements Builder<WeightRecord, WeightRecordBuilder> {
  _$WeightRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  double? _weight;
  double? get weight => _$this._weight;
  set weight(double? weight) => _$this._weight = weight;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _dropdownDate;
  String? get dropdownDate => _$this._dropdownDate;
  set dropdownDate(String? dropdownDate) => _$this._dropdownDate = dropdownDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WeightRecordBuilder() {
    WeightRecord._initializeBuilder(this);
  }

  WeightRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _weight = $v.weight;
      _date = $v.date;
      _dropdownDate = $v.dropdownDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeightRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeightRecord;
  }

  @override
  void update(void Function(WeightRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeightRecord build() => _build();

  _$WeightRecord _build() {
    final _$result = _$v ??
        new _$WeightRecord._(
            createdAt: createdAt,
            createdBy: createdBy,
            weight: weight,
            date: date,
            dropdownDate: dropdownDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
