import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_avatar_bottomsheet_widget.dart';
import '../components/add_avatar_comp_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/coacht_nav_bar_widget.dart';
import '../components/contact_data_widget.dart';
import '../components/edit_contact_data_widget.dart';
import '../components/outline_button_widget.dart';
import '../components/trainer_q_r_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for AddAvatarComp component.
  late AddAvatarCompModel addAvatarCompModel;
  // Model for ContactData component.
  late ContactDataModel contactDataModel;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel;
  // Model for OutlineButton component.
  late OutlineButtonModel outlineButtonModel;
  // Model for CoachtNavBar component.
  late CoachtNavBarModel coachtNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    addAvatarCompModel = createModel(context, () => AddAvatarCompModel());
    contactDataModel = createModel(context, () => ContactDataModel());
    addMenuComponentModel = createModel(context, () => AddMenuComponentModel());
    outlineButtonModel = createModel(context, () => OutlineButtonModel());
    coachtNavBarModel = createModel(context, () => CoachtNavBarModel());
  }

  void dispose() {
    addAvatarCompModel.dispose();
    contactDataModel.dispose();
    addMenuComponentModel.dispose();
    outlineButtonModel.dispose();
    coachtNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
