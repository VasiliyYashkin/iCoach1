import '../auth/auth_util.dart';
import '../components/app_logo_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for AppLogo component.
  late AppLogoModel appLogoModel;
  // State field(s) for emailFiel widget.
  TextEditingController? emailFielController;
  String? Function(BuildContext, String?)? emailFielControllerValidator;
  // State field(s) for passeordField widget.
  TextEditingController? passeordFieldController;
  late bool passeordFieldVisibility;
  String? Function(BuildContext, String?)? passeordFieldControllerValidator;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appLogoModel = createModel(context, () => AppLogoModel());
    passeordFieldVisibility = false;
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    appLogoModel.dispose();
    emailFielController?.dispose();
    passeordFieldController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
