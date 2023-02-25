import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_measurements_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/add_menu_widget.dart';
import '../components/add_weight_widget.dart';
import '../components/contact_data_widget.dart';
import '../components/control_notification_widget.dart';
import '../components/edit_measurements_widget.dart';
import '../components/edit_photo_widget.dart';
import '../components/edit_weight_widget.dart';
import '../components/measurements_comparison_widget.dart';
import '../components/measurements_widget.dart';
import '../components/photo_comparsion_widget.dart';
import '../components/title_and_icon_widget.dart';
import '../components/water_tracking_component_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ClientDetailPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel1;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel2;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel3;
  // Model for WaterTrackingComponent component.
  late WaterTrackingComponentModel waterTrackingComponentModel;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel1;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel2;
  // Model for measurements component.
  late MeasurementsModel measurementsModel1;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel3;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  // Model for PhotoComparsion component.
  late PhotoComparsionModel photoComparsionModel;
  // Model for measurements_comparison component.
  late MeasurementsComparisonModel measurementsComparisonModel;
  // Model for ContactData component.
  late ContactDataModel contactDataModel;
  // Model for AddMenuComponent component.
  late AddMenuComponentModel addMenuComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    controlNotificationModel1 =
        createModel(context, () => ControlNotificationModel());
    controlNotificationModel2 =
        createModel(context, () => ControlNotificationModel());
    controlNotificationModel3 =
        createModel(context, () => ControlNotificationModel());
    waterTrackingComponentModel =
        createModel(context, () => WaterTrackingComponentModel());
    titleAndIconModel1 = createModel(context, () => TitleAndIconModel());
    titleAndIconModel2 = createModel(context, () => TitleAndIconModel());
    measurementsModel1 = createModel(context, () => MeasurementsModel());
    titleAndIconModel3 = createModel(context, () => TitleAndIconModel());
    photoComparsionModel = createModel(context, () => PhotoComparsionModel());
    measurementsComparisonModel =
        createModel(context, () => MeasurementsComparisonModel());
    contactDataModel = createModel(context, () => ContactDataModel());
    addMenuComponentModel = createModel(context, () => AddMenuComponentModel());
  }

  void dispose() {
    controlNotificationModel1.dispose();
    controlNotificationModel2.dispose();
    controlNotificationModel3.dispose();
    waterTrackingComponentModel.dispose();
    titleAndIconModel1.dispose();
    titleAndIconModel2.dispose();
    measurementsModel1.dispose();
    titleAndIconModel3.dispose();
    photoComparsionModel.dispose();
    measurementsComparisonModel.dispose();
    contactDataModel.dispose();
    addMenuComponentModel.dispose();
  }

  /// Additional helper methods are added here.

}
