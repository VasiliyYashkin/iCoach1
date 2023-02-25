import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TurnOnMeasurementsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
