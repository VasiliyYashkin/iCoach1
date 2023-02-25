import '../components/filled_button_widget.dart';
import '../components/outline_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for OutlineButton component.
  late OutlineButtonModel outlineButtonModel;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    outlineButtonModel = createModel(context, () => OutlineButtonModel());
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    outlineButtonModel.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
