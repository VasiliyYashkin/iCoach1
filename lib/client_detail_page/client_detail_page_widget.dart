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
import 'client_detail_page_model.dart';
export 'client_detail_page_model.dart';

class ClientDetailPageWidget extends StatefulWidget {
  const ClientDetailPageWidget({
    Key? key,
    this.clientID,
    this.indexTab,
  }) : super(key: key);

  final DocumentReference? clientID;
  final int? indexTab;

  @override
  _ClientDetailPageWidgetState createState() => _ClientDetailPageWidgetState();
}

class _ClientDetailPageWidgetState extends State<ClientDetailPageWidget> {
  late ClientDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.indexTab == null) {
        context.pushNamed(
          'ClientDetailPage',
          queryParams: {
            'clientID': serializeParam(
              widget.clientID,
              ParamType.DocumentReference,
            ),
            'indexTab': serializeParam(
              0,
              ParamType.int,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.clientID!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final clientDetailPageUsersRecord = snapshot.data!;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AddMenuWidget(
                        user: widget.clientID,
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
              elevation: 8,
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            appBar: responsiveVisibility(
              context: context,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                    automaticallyImplyLeading: false,
                    leading: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () async {
                          context.goNamed('Clients');
                        },
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.clientID!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          final rowUsersRecord = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Text(
                                  rowUsersRecord.displayName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Colors.white,
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.goNamed(
                                    'ClientDetailPage',
                                    queryParams: {
                                      'clientID': serializeParam(
                                        widget.clientID,
                                        ParamType.DocumentReference,
                                      ),
                                      'indexTab': serializeParam(
                                        4,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      rowUsersRecord.photoUrl,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 2,
                  )
                : null,
            body: SafeArea(
              child: GestureDetector(
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
                      children: [
                        Expanded(
                          child: DefaultTabController(
                            length: 5,
                            initialIndex: min(
                                valueOrDefault<int>(
                                  widget.indexTab,
                                  0,
                                ),
                                4),
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  labelColor: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 16,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  indicatorColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  indicatorWeight: 3,
                                  tabs: [
                                    Tab(
                                      text: 'Календарь',
                                    ),
                                    Tab(
                                      text: 'Сравнение',
                                    ),
                                    Tab(
                                      text: 'Вес',
                                    ),
                                    Tab(
                                      text: 'Замеры',
                                    ),
                                    Tab(
                                      text: 'Профиль',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FlutterFlowCalendar(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            weekFormat: true,
                                            weekStartsMonday: true,
                                            initialDate: getCurrentTimestamp,
                                            rowHeight: 40,
                                            onChange: (DateTimeRange?
                                                newSelectedDate) {
                                              setState(() =>
                                                  _model.calendarSelectedDay =
                                                      newSelectedDate);
                                            },
                                            titleStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            ),
                                            dayOfWeekStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14,
                                            ),
                                            dateStyle: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            selectedDateStyle:
                                                GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            ),
                                            inactiveDateStyle: TextStyle(),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 0),
                                              child: ListView(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  if (clientDetailPageUsersRecord
                                                      .measurementsControl1!
                                                      .toList()
                                                      .contains(dateTimeFormat(
                                                        'd/M/y',
                                                        _model
                                                            .calendarSelectedDay
                                                            ?.end,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )))
                                                    StreamBuilder<
                                                        List<
                                                            MeasurementsRecord>>(
                                                      stream:
                                                          queryMeasurementsRecord(
                                                        parent: widget.clientID,
                                                        queryBuilder: (measurementsRecord) =>
                                                            measurementsRecord.where(
                                                                'dropdown_date',
                                                                isEqualTo:
                                                                    dateTimeFormat(
                                                                  'd/M/y',
                                                                  _model
                                                                      .calendarSelectedDay
                                                                      ?.start,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<MeasurementsRecord>
                                                            rowMeasurementsRecordList =
                                                            snapshot.data!;
                                                        final rowMeasurementsRecord =
                                                            rowMeasurementsRecordList
                                                                    .isNotEmpty
                                                                ? rowMeasurementsRecordList
                                                                    .first
                                                                : null;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (!(rowMeasurementsRecord !=
                                                                null))
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .controlNotificationModel1,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ControlNotificationWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .sd_card_alert_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    title:
                                                                        'Запланированные замеры',
                                                                    onTapAction:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                AddMeasurementsWidget(
                                                                              user: currentUserReference,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  if (clientDetailPageUsersRecord
                                                      .measurementsControl1!
                                                      .toList()
                                                      .contains(dateTimeFormat(
                                                        'd/M/y',
                                                        _model
                                                            .calendarSelectedDay
                                                            ?.end,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )))
                                                    StreamBuilder<
                                                        List<WeightRecord>>(
                                                      stream: queryWeightRecord(
                                                        parent: widget.clientID,
                                                        queryBuilder: (weightRecord) =>
                                                            weightRecord.where(
                                                                'dropdown_date',
                                                                isEqualTo:
                                                                    dateTimeFormat(
                                                                              'd/M/y',
                                                                              _model.calendarSelectedDay?.start,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ) !=
                                                                            ''
                                                                        ? dateTimeFormat(
                                                                            'd/M/y',
                                                                            _model.calendarSelectedDay?.start,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )
                                                                        : null),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<WeightRecord>
                                                            rowWeightRecordList =
                                                            snapshot.data!;
                                                        final rowWeightRecord =
                                                            rowWeightRecordList
                                                                    .isNotEmpty
                                                                ? rowWeightRecordList
                                                                    .first
                                                                : null;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (!(rowWeightRecord !=
                                                                null))
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .controlNotificationModel2,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ControlNotificationWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .sd_card_alert_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    title:
                                                                        'Запланированное взвешивание',
                                                                    onTapAction:
                                                                        () async {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.of(context).viewInsets,
                                                                            child:
                                                                                AddWeightWidget(),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  if (clientDetailPageUsersRecord
                                                      .photoesControl1!
                                                      .toList()
                                                      .contains(dateTimeFormat(
                                                        'd/M/y',
                                                        _model
                                                            .calendarSelectedDay
                                                            ?.end,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )))
                                                    StreamBuilder<
                                                        List<PhotoesRecord>>(
                                                      stream:
                                                          queryPhotoesRecord(
                                                        parent: widget.clientID,
                                                        queryBuilder: (photoesRecord) =>
                                                            photoesRecord.where(
                                                                'dropdown_date',
                                                                isEqualTo:
                                                                    dateTimeFormat(
                                                                              'd/M/y',
                                                                              _model.calendarSelectedDay?.start,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ) !=
                                                                            ''
                                                                        ? dateTimeFormat(
                                                                            'd/M/y',
                                                                            _model.calendarSelectedDay?.start,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )
                                                                        : null),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<PhotoesRecord>
                                                            rowPhotoesRecordList =
                                                            snapshot.data!;
                                                        final rowPhotoesRecord =
                                                            rowPhotoesRecordList
                                                                    .isNotEmpty
                                                                ? rowPhotoesRecordList
                                                                    .first
                                                                : null;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (!(rowPhotoesRecord !=
                                                                null))
                                                              Expanded(
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .controlNotificationModel3,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ControlNotificationWidget(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .sd_card_alert_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    title:
                                                                        'Запланированный фотоконтроль',
                                                                    onTapAction:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'AddPhotoesPage');
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      if (clientDetailPageUsersRecord
                                                              .waterTracking ??
                                                          true)
                                                        StreamBuilder<
                                                            List<
                                                                WaterTrackingRecord>>(
                                                          stream:
                                                              queryWaterTrackingRecord(
                                                            parent:
                                                                widget.clientID,
                                                            queryBuilder: (waterTrackingRecord) =>
                                                                waterTrackingRecord.where(
                                                                    'date_string',
                                                                    isEqualTo:
                                                                        dateTimeFormat(
                                                                      'd/M/y',
                                                                      _model
                                                                          .calendarSelectedDay
                                                                          ?.start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Вы не можете редактировать воду клиента',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x00000000),
                                                                  ),
                                                                );
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .waterTrackingComponentModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    WaterTrackingComponentWidget(
                                                                  user: widget
                                                                      .clientID,
                                                                  waterDoc:
                                                                      waterTrackingComponentWaterTrackingRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 8, 0, 8),
                                                        child: StreamBuilder<
                                                            List<WeightRecord>>(
                                                          stream:
                                                              queryWeightRecord(
                                                            parent:
                                                                widget.clientID,
                                                            queryBuilder: (weightRecord) =>
                                                                weightRecord.where(
                                                                    'dropdown_date',
                                                                    isEqualTo:
                                                                        dateTimeFormat(
                                                                      'd/M/y',
                                                                      _model
                                                                          .calendarSelectedDay
                                                                          ?.start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 50,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<WeightRecord>
                                                                containerWeightRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerWeightRecord =
                                                                containerWeightRecordList
                                                                        .isNotEmpty
                                                                    ? containerWeightRecordList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              12),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .titleAndIconModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            TitleAndIconWidget(
                                                                          title:
                                                                              'Взвешивание',
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kedit2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                18,
                                                                          ),
                                                                          action:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: EditWeightWidget(
                                                                                    weightDocument: containerWeightRecord!.reference,
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
                                                                      '${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          containerWeightRecord!
                                                                              .weight,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        ),
                                                                        '-',
                                                                      )} кг',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            fontSize:
                                                                                24,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 8),
                                                        child: StreamBuilder<
                                                            List<
                                                                MeasurementsRecord>>(
                                                          stream:
                                                              queryMeasurementsRecord(
                                                            parent:
                                                                widget.clientID,
                                                            queryBuilder: (measurementsRecord) =>
                                                                measurementsRecord.where(
                                                                    'dropdown_date',
                                                                    isEqualTo:
                                                                        dateTimeFormat(
                                                                      'd/M/y',
                                                                      _model
                                                                          .calendarSelectedDay
                                                                          ?.start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerMeasurementsRecord =
                                                                containerMeasurementsRecordList
                                                                        .isNotEmpty
                                                                    ? containerMeasurementsRecordList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              width: 100,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxHeight: 200,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.titleAndIconModel2,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            child:
                                                                                TitleAndIconWidget(
                                                                              title: 'Замеры',
                                                                              icon: Icon(
                                                                                FFIcons.kedit2,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 18,
                                                                              ),
                                                                              action: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: EditMeasurementsWidget(
                                                                                        user: widget.clientID,
                                                                                        measurementsDoc: containerMeasurementsRecord!.reference,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .measurementsModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          MeasurementsWidget(
                                                                        measurement:
                                                                            containerMeasurementsRecord,
                                                                        clientID:
                                                                            containerMeasurementsRecord!.parentReference,
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(4, 0,
                                                                    0, 16),
                                                        child: StreamBuilder<
                                                            List<
                                                                PhotoesRecord>>(
                                                          stream:
                                                              queryPhotoesRecord(
                                                            parent:
                                                                widget.clientID,
                                                            queryBuilder: (photoesRecord) =>
                                                                photoesRecord.where(
                                                                    'dropdown_date',
                                                                    isEqualTo:
                                                                        dateTimeFormat(
                                                                      'd/M/y',
                                                                      _model
                                                                          .calendarSelectedDay
                                                                          ?.start,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      SpinKitCircle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final containerPhotoesRecord =
                                                                containerPhotoesRecordList
                                                                        .isNotEmpty
                                                                    ? containerPhotoesRecordList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            12),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                8,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.titleAndIconModel3,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: TitleAndIconWidget(
                                                                                title: 'Фотоконтроль',
                                                                                icon: Icon(
                                                                                  FFIcons.kedit2,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 18,
                                                                                ),
                                                                                action: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: EditPhotoWidget(
                                                                                          user: currentUserReference,
                                                                                          photoDocument: containerPhotoesRecord!.reference,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerPhotoesRecord!.front,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: false,
                                                                                      tag: valueOrDefault<String>(
                                                                                        containerPhotoesRecord!.front,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                      ),
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: valueOrDefault<String>(
                                                                                  containerPhotoesRecord!.front,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                ),
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      containerPhotoesRecord!.front,
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
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerPhotoesRecord!.side,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: false,
                                                                                      tag: valueOrDefault<String>(
                                                                                        containerPhotoesRecord!.side,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                      ),
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: valueOrDefault<String>(
                                                                                  containerPhotoesRecord!.side,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                ),
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      containerPhotoesRecord!.side,
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
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          containerPhotoesRecord!.back,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: false,
                                                                                      tag: valueOrDefault<String>(
                                                                                        containerPhotoesRecord!.back,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                      ),
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: valueOrDefault<String>(
                                                                                  containerPhotoesRecord!.back,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                                                                ),
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      containerPhotoesRecord!.back,
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
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                initialOption: _model
                                                    .dropDownValue1 ??= 'Лицо',
                                                options: [
                                                  'Лицо',
                                                  'Профиль',
                                                  'Спина'
                                                ],
                                                onChanged: (val) => setState(
                                                    () => _model
                                                        .dropDownValue1 = val),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: Colors.black,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                hintText: 'Please select...',
                                                fillColor: Colors.white,
                                                elevation: 2,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderWidth: 0,
                                                borderRadius: 12,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 4),
                                                      child: StreamBuilder<
                                                          List<PhotoesRecord>>(
                                                        stream:
                                                            queryPhotoesRecord(
                                                          parent:
                                                              widget.clientID,
                                                          queryBuilder:
                                                              (photoesRecord) =>
                                                                  photoesRecord.orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<PhotoesRecord>
                                                              dropDownPhotoesRecordList =
                                                              snapshot.data!;
                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            initialOption: _model
                                                                    .dropDownValue2 ??=
                                                                dateTimeFormat(
                                                              'd/M/y',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            options: dropDownPhotoesRecordList
                                                                .map((e) => e
                                                                    .dropdownDate)
                                                                .withoutNulls
                                                                .toList()
                                                                .toList(),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.dropDownValue2 =
                                                                        val),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.5,
                                                            height: 50,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                            hintText:
                                                                'Выберите дату',
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            borderWidth: 0,
                                                            borderRadius: 12,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        4,
                                                                        12,
                                                                        4),
                                                            hidesUnderline:
                                                                true,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 4),
                                                      child: StreamBuilder<
                                                          List<PhotoesRecord>>(
                                                        stream:
                                                            queryPhotoesRecord(
                                                          parent:
                                                              widget.clientID,
                                                          queryBuilder:
                                                              (photoesRecord) =>
                                                                  photoesRecord.orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<PhotoesRecord>
                                                              dropDownPhotoesRecordList =
                                                              snapshot.data!;
                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            initialOption: _model
                                                                    .dropDownValue3 ??=
                                                                dateTimeFormat(
                                                              'd/M/y',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            options: dropDownPhotoesRecordList
                                                                .map((e) => e
                                                                    .dropdownDate)
                                                                .withoutNulls
                                                                .toList()
                                                                .toList(),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.dropDownValue3 =
                                                                        val),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: 50,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: Colors
                                                                          .black,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                            hintText:
                                                                'Выберите дату',
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            borderWidth: 0,
                                                            borderRadius: 12,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        4,
                                                                        12,
                                                                        4),
                                                            hidesUnderline:
                                                                true,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if ((_model.dropDownValue2 !=
                                                        null &&
                                                    _model.dropDownValue2 !=
                                                        '') ||
                                                (_model.dropDownValue3 !=
                                                        null &&
                                                    _model.dropDownValue3 !=
                                                        ''))
                                              wrapWithModel(
                                                model:
                                                    _model.photoComparsionModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: PhotoComparsionWidget(
                                                  bodyPosition:
                                                      _model.dropDownValue1,
                                                  dateBefore:
                                                      _model.dropDownValue2,
                                                  dateAfter:
                                                      _model.dropDownValue3,
                                                  user: widget.clientID,
                                                ),
                                              ),
                                            if ((_model.dropDownValue2 !=
                                                        null &&
                                                    _model.dropDownValue2 !=
                                                        '') ||
                                                (_model.dropDownValue3 !=
                                                        null &&
                                                    _model.dropDownValue3 !=
                                                        ''))
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 16, 16, 16),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      StreamBuilder<
                                                          List<WeightRecord>>(
                                                        stream:
                                                            queryWeightRecord(
                                                          parent:
                                                              widget.clientID,
                                                          queryBuilder: (weightRecord) =>
                                                              weightRecord.where(
                                                                  'dropdown_date',
                                                                  isEqualTo: _model
                                                                      .dropDownValue2),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WeightRecord>
                                                              textWeightRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textWeightRecord =
                                                              textWeightRecordList
                                                                      .isNotEmpty
                                                                  ? textWeightRecordList
                                                                      .first
                                                                  : null;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                textWeightRecord!
                                                                    .weight,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                              ),
                                                              'Вес не указан',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize: 20,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        'Вес',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize: 18,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                      StreamBuilder<
                                                          List<WeightRecord>>(
                                                        stream:
                                                            queryWeightRecord(
                                                          parent:
                                                              widget.clientID,
                                                          queryBuilder: (weightRecord) =>
                                                              weightRecord.where(
                                                                  'dropdown_date',
                                                                  isEqualTo: _model
                                                                      .dropDownValue3),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WeightRecord>
                                                              textWeightRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textWeightRecord =
                                                              textWeightRecordList
                                                                      .isNotEmpty
                                                                  ? textWeightRecordList
                                                                      .first
                                                                  : null;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                textWeightRecord!
                                                                    .weight,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                              ),
                                                              'Вес не указан',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  fontSize: 20,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if ((_model.dropDownValue2 !=
                                                        null &&
                                                    _model.dropDownValue2 !=
                                                        '') ||
                                                (_model.dropDownValue3 !=
                                                        null &&
                                                    _model.dropDownValue3 !=
                                                        ''))
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                constraints: BoxConstraints(
                                                  maxHeight: 500,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 16,
                                                                  16, 16),
                                                      child: StreamBuilder<
                                                          List<
                                                              MeasurementsRecord>>(
                                                        stream:
                                                            queryMeasurementsRecord(
                                                          parent:
                                                              widget.clientID,
                                                          queryBuilder: (measurementsRecord) =>
                                                              measurementsRecord.where(
                                                                  'dropdown_date',
                                                                  isEqualTo: _model
                                                                      .dropDownValue3),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MeasurementsRecord>
                                                              rowMeasurementsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowMeasurementsRecord =
                                                              rowMeasurementsRecordList
                                                                      .isNotEmpty
                                                                  ? rowMeasurementsRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: StreamBuilder<
                                                                    List<
                                                                        MeasurementsRecord>>(
                                                                  stream:
                                                                      queryMeasurementsRecord(
                                                                    parent: widget
                                                                        .clientID,
                                                                    queryBuilder: (measurementsRecord) => measurementsRecord.where(
                                                                        'dropdown_date',
                                                                        isEqualTo:
                                                                            _model.dropDownValue2),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              SpinKitCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                50,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<MeasurementsRecord>
                                                                        measurementsComparisonMeasurementsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final measurementsComparisonMeasurementsRecord = measurementsComparisonMeasurementsRecordList
                                                                            .isNotEmpty
                                                                        ? measurementsComparisonMeasurementsRecordList
                                                                            .first
                                                                        : null;
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .measurementsComparisonModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          MeasurementsComparisonWidget(
                                                                        clientID:
                                                                            widget.clientID,
                                                                        measurementBefore:
                                                                            measurementsComparisonMeasurementsRecord,
                                                                        measurementAfter:
                                                                            rowMeasurementsRecord,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          StreamBuilder<List<WeightRecord>>(
                                            stream: queryWeightRecord(
                                              parent: widget.clientID,
                                              queryBuilder: (weightRecord) =>
                                                  weightRecord.orderBy('date'),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<WeightRecord>
                                                  containerWeightRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 300,
                                                    child: FlutterFlowLineChart(
                                                      data: [
                                                        FFLineChartData(
                                                          xData:
                                                              containerWeightRecordList
                                                                  .map((d) =>
                                                                      d.date)
                                                                  .toList(),
                                                          yData:
                                                              containerWeightRecordList
                                                                  .map((d) =>
                                                                      d.weight)
                                                                  .toList(),
                                                          settings:
                                                              LineChartBarData(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                            barWidth: 1,
                                                            isCurved: true,
                                                            preventCurveOverShooting:
                                                                true,
                                                            belowBarData:
                                                                BarAreaData(
                                                              show: true,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                      chartStylingInfo:
                                                          ChartStylingInfo(
                                                        enableTooltip: true,
                                                        tooltipBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        backgroundColor:
                                                            Colors.white,
                                                        showGrid: true,
                                                        showBorder: false,
                                                      ),
                                                      axisBounds: AxisBounds(),
                                                      xAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        title: 'Дата',
                                                        titleTextStyle:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      yAxisLabelInfo:
                                                          AxisLabelInfo(
                                                        showLabels: true,
                                                        labelTextStyle:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                        ),
                                                        labelInterval: 10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 20, 16, 0),
                                              child: StreamBuilder<
                                                  List<WeightRecord>>(
                                                stream: queryWeightRecord(
                                                  parent: widget.clientID,
                                                  queryBuilder:
                                                      (weightRecord) =>
                                                          weightRecord.orderBy(
                                                              'dropdown_date',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<WeightRecord>
                                                      listViewWeightRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewWeightRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewWeightRecord =
                                                          listViewWeightRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewWeightRecord
                                                                    .dropdownDate,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    fontSize:
                                                                        16,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  listViewWeightRecord
                                                                      .weight,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .automatic,
                                                                ),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    fontSize:
                                                                        20,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      StreamBuilder<List<MeasurementsRecord>>(
                                        stream: queryMeasurementsRecord(
                                          parent: widget.clientID,
                                          queryBuilder: (measurementsRecord) =>
                                              measurementsRecord.orderBy(
                                                  'dropdown_date',
                                                  descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<MeasurementsRecord>
                                              listViewMeasurementsRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewMeasurementsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewMeasurementsRecord =
                                                  listViewMeasurementsRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 12),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          listViewMeasurementsRecord
                                                              .dropdownDate,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  fontSize: 18,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                    MeasurementsWidget(
                                                      key: Key(
                                                          'Key6hh_${listViewIndex}_of_${listViewMeasurementsRecordList.length}'),
                                                      measurement:
                                                          listViewMeasurementsRecord,
                                                      clientID: widget.clientID,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              widget.clientID!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: SpinKitCircle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 50,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnUsersRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.contactDataModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: ContactDataWidget(
                                                      email: columnUsersRecord
                                                          .email,
                                                      phoneNumber:
                                                          columnUsersRecord
                                                              .phoneNumber,
                                                      user: columnUsersRecord
                                                          .reference,
                                                      editData: () async {},
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .addMenuComponentModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        AddMenuComponentWidget(
                                                      title: 'Отслеживание',
                                                      icon: Icon(
                                                        FFIcons.kaddressBook,
                                                      ),
                                                      action: () async {
                                                        context.pushNamed(
                                                          'SelectTracking',
                                                          queryParams: {
                                                            'user':
                                                                serializeParam(
                                                              widget.clientID,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
