import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditContactDataModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    emailController?.dispose();
    phoneController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
