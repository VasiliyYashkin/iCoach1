import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WaterSwitchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    textController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
