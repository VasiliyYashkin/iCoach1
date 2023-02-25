import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_measurements_widget.dart';
import '../components/add_water_b_s_widget.dart';
import '../components/add_weight_widget.dart';
import '../components/client_nav_bar_widget.dart';
import '../components/control_notification_widget.dart';
import '../components/edit_measurements_widget.dart';
import '../components/edit_photo_widget.dart';
import '../components/edit_weight_widget.dart';
import '../components/meal_tracking_component_widget.dart';
import '../components/measurements_widget.dart';
import '../components/title_and_icon_widget.dart';
import '../components/water_tracking_component_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ClientHomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel1;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel2;
  // Model for ControlNotification component.
  late ControlNotificationModel controlNotificationModel3;
  // Model for MealTrackingComponent component.
  late MealTrackingComponentModel mealTrackingComponentModel;
  // Model for WaterTrackingComponent component.
  late WaterTrackingComponentModel waterTrackingComponentModel;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel1;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel2;
  // Model for measurements component.
  late MeasurementsModel measurementsModel;
  // Model for TitleAndIcon component.
  late TitleAndIconModel titleAndIconModel3;
  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

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
    mealTrackingComponentModel =
        createModel(context, () => MealTrackingComponentModel());
    waterTrackingComponentModel =
        createModel(context, () => WaterTrackingComponentModel());
    titleAndIconModel1 = createModel(context, () => TitleAndIconModel());
    titleAndIconModel2 = createModel(context, () => TitleAndIconModel());
    measurementsModel = createModel(context, () => MeasurementsModel());
    titleAndIconModel3 = createModel(context, () => TitleAndIconModel());
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  void dispose() {
    controlNotificationModel1.dispose();
    controlNotificationModel2.dispose();
    controlNotificationModel3.dispose();
    mealTrackingComponentModel.dispose();
    waterTrackingComponentModel.dispose();
    titleAndIconModel1.dispose();
    titleAndIconModel2.dispose();
    measurementsModel.dispose();
    titleAndIconModel3.dispose();
    clientNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
