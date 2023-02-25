import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/client_nav_bar_widget.dart';
import '../components/measurements_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ClientProgressModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, WeightRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  void dispose() {
    streamSubscriptions.forEach((s) => s?.cancel());
    clientNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
