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
import 'client_home_page_model.dart';
export 'client_home_page_model.dart';

class ClientHomePageWidget extends StatefulWidget {
  const ClientHomePageWidget({Key? key}) : super(key: key);

  @override
  _ClientHomePageWidgetState createState() => _ClientHomePageWidgetState();
}

class _ClientHomePageWidgetState extends State<ClientHomePageWidget> {
  late ClientHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientHomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    iconColor: FlutterFlowTheme.of(context).tertiaryColor,
                    weekFormat: true,
                    weekStartsMonday: true,
                    initialDate: getCurrentTimestamp,
                    onChange: (DateTimeRange? newSelectedDate) {
                      setState(
                          () => _model.calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: GoogleFonts.getFont(
                      'Roboto',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    dayOfWeekStyle: GoogleFonts.getFont(
                      'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14,
                    ),
                    dateStyle: TextStyle(),
                    selectedDateStyle: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    inactiveDateStyle: GoogleFonts.getFont(
                      'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 18,
                    ),
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: [
                        if ((currentUserDocument?.measurementsControl1
                                    ?.toList() ??
                                [])
                            .contains(dateTimeFormat(
                          'd/M/y',
                          _model.calendarSelectedDay?.end,
                          locale: FFLocalizations.of(context).languageCode,
                        )))
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<MeasurementsRecord>>(
                              stream: queryMeasurementsRecord(
                                parent: currentUserReference,
                                queryBuilder: (measurementsRecord) =>
                                    measurementsRecord.where('dropdown_date',
                                        isEqualTo: dateTimeFormat(
                                          'd/M/y',
                                          _model.calendarSelectedDay?.end,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<MeasurementsRecord>
                                    rowMeasurementsRecordList = snapshot.data!;
                                final rowMeasurementsRecord =
                                    rowMeasurementsRecordList.isNotEmpty
                                        ? rowMeasurementsRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(rowMeasurementsRecord != null))
                                      Expanded(
                                        child: wrapWithModel(
                                          model:
                                              _model.controlNotificationModel1,
                                          updateCallback: () => setState(() {}),
                                          child: ControlNotificationWidget(
                                            icon: Icon(
                                              Icons.sd_card_alert_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            title: 'Запланированные замеры',
                                            onTapAction: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        AddMeasurementsWidget(
                                                      user:
                                                          currentUserReference,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if ((currentUserDocument?.widghtControl1?.toList() ??
                                [])
                            .contains(dateTimeFormat(
                          'd/M/y',
                          _model.calendarSelectedDay?.end,
                          locale: FFLocalizations.of(context).languageCode,
                        )))
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<WeightRecord>>(
                              stream: queryWeightRecord(
                                parent: currentUserReference,
                                queryBuilder: (weightRecord) =>
                                    weightRecord.where('dropdown_date',
                                        isEqualTo: dateTimeFormat(
                                                  'd/M/y',
                                                  _model
                                                      .calendarSelectedDay?.end,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ) !=
                                                ''
                                            ? dateTimeFormat(
                                                'd/M/y',
                                                _model.calendarSelectedDay?.end,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : null),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<WeightRecord> rowWeightRecordList =
                                    snapshot.data!;
                                final rowWeightRecord =
                                    rowWeightRecordList.isNotEmpty
                                        ? rowWeightRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(rowWeightRecord != null))
                                      Expanded(
                                        child: wrapWithModel(
                                          model:
                                              _model.controlNotificationModel2,
                                          updateCallback: () => setState(() {}),
                                          child: ControlNotificationWidget(
                                            icon: Icon(
                                              Icons.sd_card_alert_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            title:
                                                'Запланированное взвешивание',
                                            onTapAction: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: AddWeightWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if ((currentUserDocument?.photoesControl1?.toList() ??
                                [])
                            .contains(dateTimeFormat(
                          'd/M/y',
                          _model.calendarSelectedDay?.end,
                          locale: FFLocalizations.of(context).languageCode,
                        )))
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<PhotoesRecord>>(
                              stream: queryPhotoesRecord(
                                parent: currentUserReference,
                                queryBuilder: (photoesRecord) =>
                                    photoesRecord.where('dropdown_date',
                                        isEqualTo: dateTimeFormat(
                                                  'd/M/y',
                                                  _model
                                                      .calendarSelectedDay?.end,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ) !=
                                                ''
                                            ? dateTimeFormat(
                                                'd/M/y',
                                                _model.calendarSelectedDay?.end,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : null),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<PhotoesRecord> rowPhotoesRecordList =
                                    snapshot.data!;
                                final rowPhotoesRecord =
                                    rowPhotoesRecordList.isNotEmpty
                                        ? rowPhotoesRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(rowPhotoesRecord != null))
                                      Expanded(
                                        child: wrapWithModel(
                                          model:
                                              _model.controlNotificationModel3,
                                          updateCallback: () => setState(() {}),
                                          child: ControlNotificationWidget(
                                            icon: Icon(
                                              Icons.sd_card_alert_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            title:
                                                'Запланированный фотоконтроль',
                                            onTapAction: () async {
                                              context
                                                  .pushNamed('AddPhotoesPage');
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (currentUserDocument!
                                    .mealTracking.mealTrackingOn ??
                                true)
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<MealTrackingRecord>>(
                                  stream: queryMealTrackingRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (mealTrackingRecord) =>
                                        mealTrackingRecord.where('date_string',
                                            isEqualTo: dateTimeFormat(
                                              'd/M/y',
                                              _model.calendarSelectedDay?.start,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MealTrackingRecord>
                                        mealTrackingComponentMealTrackingRecordList =
                                        snapshot.data!;
                                    final mealTrackingComponentMealTrackingRecord =
                                        mealTrackingComponentMealTrackingRecordList
                                                .isNotEmpty
                                            ? mealTrackingComponentMealTrackingRecordList
                                                .first
                                            : null;
                                    return wrapWithModel(
                                      model: _model.mealTrackingComponentModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: MealTrackingComponentWidget(
                                        user: currentUserReference,
                                        mealTrckingDoc:
                                            mealTrackingComponentMealTrackingRecord,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.waterTracking, false))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<WaterTrackingRecord>>(
                                    stream: queryWaterTrackingRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (waterTrackingRecord) =>
                                          waterTrackingRecord.where(
                                              'date_string',
                                              isEqualTo: dateTimeFormat(
                                                'd/M/y',
                                                _model
                                                    .calendarSelectedDay?.start,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<WaterTrackingRecord>
                                          waterTrackingComponentWaterTrackingRecordList =
                                          snapshot.data!;
                                      final waterTrackingComponentWaterTrackingRecord =
                                          waterTrackingComponentWaterTrackingRecordList
                                                  .isNotEmpty
                                              ? waterTrackingComponentWaterTrackingRecordList
                                                  .first
                                              : null;
                                      return InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: AddWaterBSWidget(
                                                  waterTrackingDoc:
                                                      waterTrackingComponentWaterTrackingRecord,
                                                  date: _model
                                                      .calendarSelectedDay
                                                      ?.start,
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .waterTrackingComponentModel,
                                          updateCallback: () => setState(() {}),
                                          child: WaterTrackingComponentWidget(
                                            user: currentUserReference,
                                            waterDoc:
                                                waterTrackingComponentWaterTrackingRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 8, 0, 8),
                              child: StreamBuilder<List<WeightRecord>>(
                                stream: queryWeightRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (weightRecord) =>
                                      weightRecord.where('dropdown_date',
                                          isEqualTo: dateTimeFormat(
                                            'd/M/y',
                                            _model.calendarSelectedDay?.start,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<WeightRecord> containerWeightRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerWeightRecord =
                                      containerWeightRecordList.isNotEmpty
                                          ? containerWeightRecordList.first
                                          : null;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 12),
                                            child: wrapWithModel(
                                              model: _model.titleAndIconModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: TitleAndIconWidget(
                                                title: 'Взвешивание',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18,
                                                ),
                                                action: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: EditWeightWidget(
                                                          weightDocument:
                                                              containerWeightRecord!
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                formatNumber(
                                                  containerWeightRecord!.weight,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '-',
                                              )} кг',
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontSize: 24,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 8),
                              child: StreamBuilder<List<MeasurementsRecord>>(
                                stream: queryMeasurementsRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (measurementsRecord) =>
                                      measurementsRecord.where('dropdown_date',
                                          isEqualTo: dateTimeFormat(
                                            'd/M/y',
                                            _model.calendarSelectedDay?.start,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MeasurementsRecord>
                                      containerMeasurementsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerMeasurementsRecord =
                                      containerMeasurementsRecordList.isNotEmpty
                                          ? containerMeasurementsRecordList
                                              .first
                                          : null;
                                  return Container(
                                    width: 100,
                                    constraints: BoxConstraints(
                                      maxHeight: 200,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: wrapWithModel(
                                                  model:
                                                      _model.titleAndIconModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: TitleAndIconWidget(
                                                    title: 'Замеры',
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.edit,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18,
                                                    ),
                                                    action: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                EditMeasurementsWidget(
                                                              user:
                                                                  currentUserReference,
                                                              measurementsDoc:
                                                                  containerMeasurementsRecord!
                                                                      .reference,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: wrapWithModel(
                                            model: _model.measurementsModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: MeasurementsWidget(
                                              measurement:
                                                  containerMeasurementsRecord,
                                              clientID:
                                                  containerMeasurementsRecord!
                                                      .parentReference,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 16),
                              child: StreamBuilder<List<PhotoesRecord>>(
                                stream: queryPhotoesRecord(
                                  parent: currentUserReference,
                                  queryBuilder: (photoesRecord) =>
                                      photoesRecord.where('dropdown_date',
                                          isEqualTo: dateTimeFormat(
                                            'd/M/y',
                                            _model.calendarSelectedDay?.start,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PhotoesRecord>
                                      containerPhotoesRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerPhotoesRecord =
                                      containerPhotoesRecordList.isNotEmpty
                                          ? containerPhotoesRecordList.first
                                          : null;
                                  return Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .titleAndIconModel3,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: TitleAndIconWidget(
                                                      title: 'Фотоконтроль',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.edit,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 18,
                                                      ),
                                                      action: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  EditPhotoWidget(
                                                                user:
                                                                    currentUserReference,
                                                                photoDocument:
                                                                    containerPhotoesRecord!
                                                                        .reference,
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerPhotoesRecord!
                                                                    .front,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: valueOrDefault<
                                                                String>(
                                                              containerPhotoesRecord!
                                                                  .front,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                            ),
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: valueOrDefault<
                                                          String>(
                                                        containerPhotoesRecord!
                                                            .front,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                      ),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerPhotoesRecord!
                                                                .front,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerPhotoesRecord!
                                                                    .side,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: valueOrDefault<
                                                                String>(
                                                              containerPhotoesRecord!
                                                                  .side,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                            ),
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: valueOrDefault<
                                                          String>(
                                                        containerPhotoesRecord!
                                                            .side,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                      ),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerPhotoesRecord!
                                                                .side,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerPhotoesRecord!
                                                                    .back,
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: valueOrDefault<
                                                                String>(
                                                              containerPhotoesRecord!
                                                                  .back,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                            ),
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: valueOrDefault<
                                                          String>(
                                                        containerPhotoesRecord!
                                                            .back,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                      ),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            containerPhotoesRecord!
                                                                .back,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: wrapWithModel(
                    model: _model.clientNavBarModel,
                    updateCallback: () => setState(() {}),
                    child: ClientNavBarWidget(
                      page: 'ClientCalendar',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
