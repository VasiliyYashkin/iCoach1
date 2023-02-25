import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _SearchIsActive = false;
  bool get SearchIsActive => _SearchIsActive;
  set SearchIsActive(bool _value) {
    _SearchIsActive = _value;
  }

  DocumentReference? _SelectedUser;
  DocumentReference? get SelectedUser => _SelectedUser;
  set SelectedUser(DocumentReference? _value) {
    _SelectedUser = _value;
  }

  List<String> _PlanWDates = [];
  List<String> get PlanWDates => _PlanWDates;
  set PlanWDates(List<String> _value) {
    _PlanWDates = _value;
  }

  void addToPlanWDates(String _value) {
    _PlanWDates.add(_value);
  }

  void removeFromPlanWDates(String _value) {
    _PlanWDates.remove(_value);
  }

  void removeAtIndexFromPlanWDates(int _index) {
    _PlanWDates.removeAt(_index);
  }

  List<String> _PlannedPhContDates = [];
  List<String> get PlannedPhContDates => _PlannedPhContDates;
  set PlannedPhContDates(List<String> _value) {
    _PlannedPhContDates = _value;
  }

  void addToPlannedPhContDates(String _value) {
    _PlannedPhContDates.add(_value);
  }

  void removeFromPlannedPhContDates(String _value) {
    _PlannedPhContDates.remove(_value);
  }

  void removeAtIndexFromPlannedPhContDates(int _index) {
    _PlannedPhContDates.removeAt(_index);
  }

  List<String> _PlanMeasDates = [];
  List<String> get PlanMeasDates => _PlanMeasDates;
  set PlanMeasDates(List<String> _value) {
    _PlanMeasDates = _value;
  }

  void addToPlanMeasDates(String _value) {
    _PlanMeasDates.add(_value);
  }

  void removeFromPlanMeasDates(String _value) {
    _PlanMeasDates.remove(_value);
  }

  void removeAtIndexFromPlanMeasDates(int _index) {
    _PlanMeasDates.removeAt(_index);
  }

  bool _editDate = false;
  bool get editDate => _editDate;
  set editDate(bool _value) {
    _editDate = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
