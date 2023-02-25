import '../components/add_measurements_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/add_weight_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMenuModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel1;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel2;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addMenuComponentModel1 =
        createModel(context, () => AddMenuComponentModel());
    addMenuComponentModel2 =
        createModel(context, () => AddMenuComponentModel());
    addMenuComponentModel3 =
        createModel(context, () => AddMenuComponentModel());
  }

  void dispose() {
    addMenuComponentModel1.dispose();
    addMenuComponentModel2.dispose();
    addMenuComponentModel3.dispose();
  }

  /// Additional helper methods are added here.

}
