// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photoes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoesRecord> _$photoesRecordSerializer =
    new _$PhotoesRecordSerializer();

class _$PhotoesRecordSerializer implements StructuredSerializer<PhotoesRecord> {
  @override
  final Iterable<Type> types = const [PhotoesRecord, _$PhotoesRecord];
  @override
  final String wireName = 'PhotoesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PhotoesRecord object,
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
    value = object.front;
    if (value != null) {
      result
        ..add('Front')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.side;
    if (value != null) {
      result
        ..add('Side')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.back;
    if (value != null) {
      result
        ..add('Back')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PhotoesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoesRecordBuilder();

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
        case 'Front':
          result.front = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Side':
          result.side = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Back':
          result.back = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PhotoesRecord extends PhotoesRecord {
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final String? front;
  @override
  final String? side;
  @override
  final String? back;
  @override
  final String? dropdownDate;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PhotoesRecord([void Function(PhotoesRecordBuilder)? updates]) =>
      (new PhotoesRecordBuilder()..update(updates))._build();

  _$PhotoesRecord._(
      {this.createdAt,
      this.createdBy,
      this.front,
      this.side,
      this.back,
      this.dropdownDate,
      this.date,
      this.ffRef})
      : super._();

  @override
  PhotoesRecord rebuild(void Function(PhotoesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoesRecordBuilder toBuilder() => new PhotoesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoesRecord &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        front == other.front &&
        side == other.side &&
        back == other.back &&
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
                        $jc($jc($jc(0, createdAt.hashCode), createdBy.hashCode),
                            front.hashCode),
                        side.hashCode),
                    back.hashCode),
                dropdownDate.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhotoesRecord')
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('front', front)
          ..add('side', side)
          ..add('back', back)
          ..add('dropdownDate', dropdownDate)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PhotoesRecordBuilder
    implements Builder<PhotoesRecord, PhotoesRecordBuilder> {
  _$PhotoesRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  String? _front;
  String? get front => _$this._front;
  set front(String? front) => _$this._front = front;

  String? _side;
  String? get side => _$this._side;
  set side(String? side) => _$this._side = side;

  String? _back;
  String? get back => _$this._back;
  set back(String? back) => _$this._back = back;

  String? _dropdownDate;
  String? get dropdownDate => _$this._dropdownDate;
  set dropdownDate(String? dropdownDate) => _$this._dropdownDate = dropdownDate;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PhotoesRecordBuilder() {
    PhotoesRecord._initializeBuilder(this);
  }

  PhotoesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _front = $v.front;
      _side = $v.side;
      _back = $v.back;
      _dropdownDate = $v.dropdownDate;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhotoesRecord;
  }

  @override
  void update(void Function(PhotoesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoesRecord build() => _build();

  _$PhotoesRecord _build() {
    final _$result = _$v ??
        new _$PhotoesRecord._(
            createdAt: createdAt,
            createdBy: createdBy,
            front: front,
            side: side,
            back: back,
            dropdownDate: dropdownDate,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
