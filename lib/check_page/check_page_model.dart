import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_coach_bottom_sheet_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/coach_card_widget.dart';
import '../components/contact_data_widget.dart';
import '../components/edit_contact_data_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for CoachCard component.
  late CoachCardModel coachCardModel;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel1;
  var trainerStringID = '';
  // Model for ContactData component.
  late ContactDataModel contactDataModel;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel2;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    coachCardModel = createModel(context, () => CoachCardModel());
    addMenuComponentModel1 =
        createModel(context, () => AddMenuComponentModel());
    contactDataModel = createModel(context, () => ContactDataModel());
    addMenuComponentModel2 =
        createModel(context, () => AddMenuComponentModel());
    addMenuComponentModel3 =
        createModel(context, () => AddMenuComponentModel());
  }

  void dispose() {
    coachCardModel.dispose();
    addMenuComponentModel1.dispose();
    contactDataModel.dispose();
    addMenuComponentModel2.dispose();
    addMenuComponentModel3.dispose();
  }

  /// Additional helper methods are added here.

}
