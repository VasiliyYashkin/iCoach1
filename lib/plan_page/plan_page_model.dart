import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../components/list_of_users_for_planning_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel1;
  DateTime? datePicked1;
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel2;
  DateTime? datePicked2;
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel3;
  DateTime? datePicked3;
  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chooseDateModel1 = createModel(context, () => ChooseDateModel());
    chooseDateModel2 = createModel(context, () => ChooseDateModel());
    chooseDateModel3 = createModel(context, () => ChooseDateModel());
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    chooseDateModel1.dispose();
    chooseDateModel2.dispose();
    chooseDateModel3.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
