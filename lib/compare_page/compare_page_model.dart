import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/client_nav_bar_widget.dart';
import '../components/measurements_part_widget.dart';
import '../components/photo_comparsion_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComparePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  // Model for PhotoComparsion component.
  late PhotoComparsionModel photoComparsionModel;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel1;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel2;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel3;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel4;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel5;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel6;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel7;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel8;
  // Model for MeasurementsPart component.
  late MeasurementsPartModel measurementsPartModel9;
  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoComparsionModel = createModel(context, () => PhotoComparsionModel());
    measurementsPartModel1 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel2 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel3 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel4 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel5 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel6 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel7 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel8 =
        createModel(context, () => MeasurementsPartModel());
    measurementsPartModel9 =
        createModel(context, () => MeasurementsPartModel());
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  void dispose() {
    photoComparsionModel.dispose();
    measurementsPartModel1.dispose();
    measurementsPartModel2.dispose();
    measurementsPartModel3.dispose();
    measurementsPartModel4.dispose();
    measurementsPartModel5.dispose();
    measurementsPartModel6.dispose();
    measurementsPartModel7.dispose();
    measurementsPartModel8.dispose();
    measurementsPartModel9.dispose();
    clientNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
