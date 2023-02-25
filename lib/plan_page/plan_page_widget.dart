import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../components/list_of_users_for_planning_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plan_page_model.dart';
export 'plan_page_model.dart';

class PlanPageWidget extends StatefulWidget {
  const PlanPageWidget({Key? key}) : super(key: key);

  @override
  _PlanPageWidgetState createState() => _PlanPageWidgetState();
}

class _PlanPageWidgetState extends State<PlanPageWidget> {
  late PlanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().SelectedUser = null;
      });
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Запланировать',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: FlutterFlowTheme.of(context).title3Family,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title3Family),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 5,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (FFAppState().SelectedUser == null)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Выберите клиента',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontSize: 18,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: ListOfUsersForPlanningWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().SelectedUser != null)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: StreamBuilder<UsersRecord>(
                        stream:
                            UsersRecord.getDocument(FFAppState().SelectedUser!),
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
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Container(
                                  width: 70,
                                  height: 70,
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
                              Text(
                                valueOrDefault<String>(
                                  rowUsersRecord.displayName,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .title1Family,
                                      fontSize: 20,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .title1Family),
                                    ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().SelectedUser = null;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  Text(
                    'Запланировать:',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 18,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.63,
                    decoration: BoxDecoration(),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontSize: 14,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            tabs: [
                              Tab(
                                text: 'Взвешивание',
                              ),
                              Tab(
                                text: 'Замеры',
                              ),
                              Tab(
                                text: 'Фотоконтроль',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (FFAppState().SelectedUser != null)
                                      Builder(
                                        builder: (context) {
                                          final weightControlDates =
                                              FFAppState().PlanWDates.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                weightControlDates.length,
                                            itemBuilder: (context,
                                                weightControlDatesIndex) {
                                              final weightControlDatesItem =
                                                  weightControlDates[
                                                      weightControlDatesIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      weightControlDatesItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .removeFromPlanWDates(
                                                                weightControlDatesItem);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (FFAppState().SelectedUser != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: wrapWithModel(
                                          model: _model.chooseDateModel1,
                                          updateCallback: () => setState(() {}),
                                          child: ChooseDateWidget(
                                            date: valueOrDefault<String>(
                                              dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked1,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'Выберите дату',
                                            ),
                                            datePickerAction: () async {
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked1Date != null) {
                                                setState(() {
                                                  _model.datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  );
                                                });
                                              }
                                              if (FFAppState()
                                                  .PlanWDates
                                                  .contains(dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked1,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Выбранная дата уже есть в списке',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                  ),
                                                );
                                                return;
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState().addToPlanWDates(
                                                      dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked1,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ));
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (FFAppState().SelectedUser != null)
                                      Builder(
                                        builder: (context) {
                                          final measurementsControlDates =
                                              FFAppState()
                                                  .PlanMeasDates
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                measurementsControlDates.length,
                                            itemBuilder: (context,
                                                measurementsControlDatesIndex) {
                                              final measurementsControlDatesItem =
                                                  measurementsControlDates[
                                                      measurementsControlDatesIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      measurementsControlDatesItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .removeFromPlanMeasDates(
                                                                measurementsControlDatesItem);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (FFAppState().SelectedUser != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: wrapWithModel(
                                          model: _model.chooseDateModel2,
                                          updateCallback: () => setState(() {}),
                                          child: ChooseDateWidget(
                                            date: valueOrDefault<String>(
                                              dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked2,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'Выберите дату',
                                            ),
                                            datePickerAction: () async {
                                              final _datePicked2Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked2Date != null) {
                                                setState(() {
                                                  _model.datePicked2 = DateTime(
                                                    _datePicked2Date.year,
                                                    _datePicked2Date.month,
                                                    _datePicked2Date.day,
                                                  );
                                                });
                                              }
                                              if (FFAppState()
                                                  .PlanMeasDates
                                                  .contains(dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked2,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Выбранная дата уже есть в списке',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                  ),
                                                );
                                                return;
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .addToPlanMeasDates(
                                                          dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked2,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ));
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (FFAppState().SelectedUser != null)
                                      Builder(
                                        builder: (context) {
                                          final photoControlDates = FFAppState()
                                              .PlannedPhContDates
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: photoControlDates.length,
                                            itemBuilder: (context,
                                                photoControlDatesIndex) {
                                              final photoControlDatesItem =
                                                  photoControlDates[
                                                      photoControlDatesIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      photoControlDatesItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .removeFromPlannedPhContDates(
                                                                photoControlDatesItem);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (FFAppState().SelectedUser != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: wrapWithModel(
                                          model: _model.chooseDateModel3,
                                          updateCallback: () => setState(() {}),
                                          child: ChooseDateWidget(
                                            date: valueOrDefault<String>(
                                              dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked3,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'Выберите дату',
                                            ),
                                            datePickerAction: () async {
                                              final _datePicked3Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked3Date != null) {
                                                setState(() {
                                                  _model.datePicked3 = DateTime(
                                                    _datePicked3Date.year,
                                                    _datePicked3Date.month,
                                                    _datePicked3Date.day,
                                                  );
                                                });
                                              }
                                              if (FFAppState()
                                                  .PlannedPhContDates
                                                  .contains(dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked3,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ))) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Выбранная дата уже есть в списке',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                  ),
                                                );
                                                return;
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .addToPlannedPhContDates(
                                                          dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked3,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ));
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          wrapWithModel(
                            model: _model.filledButtonModel,
                            updateCallback: () => setState(() {}),
                            child: FilledButtonWidget(
                              buttonTitle: 'Сохранить',
                              buttonAction: () async {
                                final usersUpdateData = {
                                  'widght_control1': FFAppState().PlanWDates,
                                  'measurements_control1':
                                      FFAppState().PlanMeasDates,
                                  'photoes_control1':
                                      FFAppState().PlannedPhContDates,
                                };
                                await FFAppState()
                                    .SelectedUser!
                                    .update(usersUpdateData);
                                triggerPushNotification(
                                  notificationTitle: 'Запланирован контроль',
                                  notificationText:
                                      'Тренером запланировано ${valueOrDefault<String>(
                                    FFAppState().PlanWDates.length.toString(),
                                    '0',
                                  )}взвешиваний, ${valueOrDefault<String>(
                                    FFAppState()
                                        .PlanMeasDates
                                        .length
                                        .toString(),
                                    '0',
                                  )}  замеров и ${valueOrDefault<String>(
                                    FFAppState()
                                        .PlannedPhContDates
                                        .length
                                        .toString(),
                                    '0',
                                  )} фото контролей',
                                  notificationSound: 'default',
                                  userRefs: [FFAppState().SelectedUser!],
                                  initialPageName: 'ClientHomePage',
                                  parameterData: {},
                                );
                                context.pop();
                              },
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
    );
  }
}
