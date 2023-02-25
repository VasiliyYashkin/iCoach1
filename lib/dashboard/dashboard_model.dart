import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/coacht_nav_bar_widget.dart';
import '../components/measurements_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for CoachtNavBar component.
  late CoachtNavBarModel coachtNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    coachtNavBarModel = createModel(context, () => CoachtNavBarModel());
  }

  void dispose() {
    coachtNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
