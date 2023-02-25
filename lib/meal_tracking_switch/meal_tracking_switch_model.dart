import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class MealTrackingSwitchModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? trackingIsOn = false;

  int? calories;

  int? proteins;

  int? fats;

  int? carbs;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for kkalFull widget.
  TextEditingController? kkalFullController;
  String? Function(BuildContext, String?)? kkalFullControllerValidator;
  // State field(s) for kkalEmpty widget.
  TextEditingController? kkalEmptyController;
  String? Function(BuildContext, String?)? kkalEmptyControllerValidator;
  // State field(s) for protFull widget.
  TextEditingController? protFullController;
  final protFullMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? protFullControllerValidator;
  // State field(s) for protEmpty widget.
  TextEditingController? protEmptyController;
  final protEmptyMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? protEmptyControllerValidator;
  // State field(s) for fatFull widget.
  TextEditingController? fatFullController;
  final fatFullMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? fatFullControllerValidator;
  // State field(s) for fatEmpty widget.
  TextEditingController? fatEmptyController;
  final fatEmptyMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? fatEmptyControllerValidator;
  // State field(s) for carbFull widget.
  TextEditingController? carbFullController;
  final carbFullMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? carbFullControllerValidator;
  // State field(s) for carbEmpty widget.
  TextEditingController? carbEmptyController;
  final carbEmptyMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? carbEmptyControllerValidator;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    kkalFullController?.dispose();
    kkalEmptyController?.dispose();
    protFullController?.dispose();
    protEmptyController?.dispose();
    fatFullController?.dispose();
    fatEmptyController?.dispose();
    carbFullController?.dispose();
    carbEmptyController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
