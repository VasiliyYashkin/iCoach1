import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/app_logo_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for AppLogo component.
  late AppLogoModel appLogoModel;
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPassword widget.
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appLogoModel = createModel(context, () => AppLogoModel());
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    appLogoModel.dispose();
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
