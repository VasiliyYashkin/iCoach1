import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../components/manage_measurements_b_s_widget.dart';
import '../components/turn_on_measurements_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditMeasurementsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel;
  DateTime? datePicked;
  // State field(s) for chest widget.
  TextEditingController? chestController;
  String? Function(BuildContext, String?)? chestControllerValidator;
  // State field(s) for waist widget.
  TextEditingController? waistController;
  String? Function(BuildContext, String?)? waistControllerValidator;
  // State field(s) for Buttocks widget.
  TextEditingController? buttocksController;
  String? Function(BuildContext, String?)? buttocksControllerValidator;
  // State field(s) for hip_left widget.
  TextEditingController? hipLeftController;
  String? Function(BuildContext, String?)? hipLeftControllerValidator;
  // State field(s) for hip_right widget.
  TextEditingController? hipRightController;
  String? Function(BuildContext, String?)? hipRightControllerValidator;
  // State field(s) for biceps_left widget.
  TextEditingController? bicepsLeftController;
  String? Function(BuildContext, String?)? bicepsLeftControllerValidator;
  // State field(s) for biceps_right widget.
  TextEditingController? bicepsRightController;
  String? Function(BuildContext, String?)? bicepsRightControllerValidator;
  // State field(s) for shin_left widget.
  TextEditingController? shinLeftController;
  String? Function(BuildContext, String?)? shinLeftControllerValidator;
  // State field(s) for shin_right widget.
  TextEditingController? shinRightController;
  String? Function(BuildContext, String?)? shinRightControllerValidator;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;
  // Model for TurnOnMeasurements component.
  late TurnOnMeasurementsModel turnOnMeasurementsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chooseDateModel = createModel(context, () => ChooseDateModel());
    filledButtonModel = createModel(context, () => FilledButtonModel());
    turnOnMeasurementsModel =
        createModel(context, () => TurnOnMeasurementsModel());
  }

  void dispose() {
    chooseDateModel.dispose();
    chestController?.dispose();
    waistController?.dispose();
    buttocksController?.dispose();
    hipLeftController?.dispose();
    hipRightController?.dispose();
    bicepsLeftController?.dispose();
    bicepsRightController?.dispose();
    shinLeftController?.dispose();
    shinRightController?.dispose();
    filledButtonModel.dispose();
    turnOnMeasurementsModel.dispose();
  }

  /// Additional helper methods are added here.

}
