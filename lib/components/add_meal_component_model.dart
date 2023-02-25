import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMealComponentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  double? caloriesFact;

  double? proteins;

  double? fats;

  double? carbs;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
