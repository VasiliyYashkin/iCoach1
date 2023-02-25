import '../backend/backend.dart';
import '../components/manage_measurements_b_s_widget.dart';
import '../components/tracking_page_container_widget.dart';
import '../components/under_construction_widget.dart';
import '../components/water_switch_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectTrackingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for TrackingPageContainer component.
  late TrackingPageContainerModel trackingPageContainerModel1;
  // Model for TrackingPageContainer component.
  late TrackingPageContainerModel trackingPageContainerModel2;
  // Model for TrackingPageContainer component.
  late TrackingPageContainerModel trackingPageContainerModel3;
  // Model for TrackingPageContainer component.
  late TrackingPageContainerModel trackingPageContainerModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    trackingPageContainerModel1 =
        createModel(context, () => TrackingPageContainerModel());
    trackingPageContainerModel2 =
        createModel(context, () => TrackingPageContainerModel());
    trackingPageContainerModel3 =
        createModel(context, () => TrackingPageContainerModel());
    trackingPageContainerModel4 =
        createModel(context, () => TrackingPageContainerModel());
  }

  void dispose() {
    trackingPageContainerModel1.dispose();
    trackingPageContainerModel2.dispose();
    trackingPageContainerModel3.dispose();
    trackingPageContainerModel4.dispose();
  }

  /// Additional helper methods are added here.

}
