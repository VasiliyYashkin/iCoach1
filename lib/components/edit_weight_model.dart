import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWeightModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно';
    }

    return null;
  }

  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chooseDateModel = createModel(context, () => ChooseDateModel());
    textControllerValidator = _textControllerValidator;
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    chooseDateModel.dispose();
    textController?.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
