import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_avatar_bottomsheet_widget.dart';
import '../components/add_avatar_comp_widget.dart';
import '../components/client_nav_bar_widget.dart';
import '../components/outline_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for AddAvatarComp component.
  late AddAvatarCompModel addAvatarCompModel;
  // Model for OutlineButton component.
  late OutlineButtonModel outlineButtonModel;
  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addAvatarCompModel = createModel(context, () => AddAvatarCompModel());
    outlineButtonModel = createModel(context, () => OutlineButtonModel());
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  void dispose() {
    addAvatarCompModel.dispose();
    outlineButtonModel.dispose();
    clientNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
