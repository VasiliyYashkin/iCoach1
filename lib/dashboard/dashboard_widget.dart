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
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

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
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            'Привет, ${currentUserDisplayName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                        ),
                        Text(
                          dateTimeFormat(
                            'd/M/y',
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: Colors.white,
                                fontSize: 20,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord
                          .where('coach_ref', isEqualTo: currentUserReference),
                    ),
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
                      List<UsersRecord> containerUsersRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('Clients');
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Всего клиентов',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  containerUsersRecordList
                                                      .length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: StreamBuilder<List<WeightRecord>>(
                                  stream: queryWeightRecord(
                                    queryBuilder: (weightRecord) => weightRecord
                                        .whereIn(
                                            'created_by',
                                            containerUsersRecordList
                                                .map((e) => e.reference)
                                                .toList())
                                        .where('dropdown_date',
                                            isEqualTo: dateTimeFormat(
                                              'd/M/y',
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )),
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
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            rowWeightRecordList.length,
                                            (rowIndex) {
                                          final rowWeightRecord =
                                              rowWeightRecordList[rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ClientDetailPage',
                                                  queryParams: {
                                                    'clientID': serializeParam(
                                                      rowWeightRecord
                                                          .parentReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'indexTab': serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                rowWeightRecord
                                                                    .parentReference),
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
                                                          final rowUsersRecord =
                                                              snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      rowUsersRecord
                                                                          .photoUrl,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  rowUsersRecord
                                                                      .displayName,
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 12,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Вес',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                rowWeightRecord
                                                                    .weight!,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: StreamBuilder<List<MeasurementsRecord>>(
                                  stream: queryMeasurementsRecord(
                                    queryBuilder: (measurementsRecord) =>
                                        measurementsRecord
                                            .whereIn(
                                                'created_by',
                                                containerUsersRecordList
                                                    .map((e) => e.reference)
                                                    .toList())
                                            .where('dropdown_date',
                                                isEqualTo: dateTimeFormat(
                                                  'd/M/y',
                                                  getCurrentTimestamp,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )),
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
                                        rowMeasurementsRecordList =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            rowMeasurementsRecordList.length,
                                            (rowIndex) {
                                          final rowMeasurementsRecord =
                                              rowMeasurementsRecordList[
                                                  rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ClientDetailPage',
                                                  queryParams: {
                                                    'clientID': serializeParam(
                                                      rowMeasurementsRecord
                                                          .parentReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'indexTab': serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                constraints: BoxConstraints(
                                                  maxHeight: 220,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 4),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  rowMeasurementsRecord
                                                                      .parentReference),
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
                                                            final rowUsersRecord =
                                                                snapshot.data!;
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          12,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        rowUsersRecord
                                                                            .photoUrl,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  rowUsersRecord
                                                                      .displayName!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            MeasurementsWidget(
                                                          key: Key(
                                                              'Keyqsh_${rowIndex}_of_${rowMeasurementsRecordList.length}'),
                                                          measurement:
                                                              rowMeasurementsRecord,
                                                          clientID:
                                                              rowMeasurementsRecord
                                                                  .parentReference,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 16),
                                child: StreamBuilder<List<PhotoesRecord>>(
                                  stream: queryPhotoesRecord(
                                    queryBuilder: (photoesRecord) =>
                                        photoesRecord
                                            .whereIn(
                                                'created_by',
                                                containerUsersRecordList
                                                    .map((e) => e.reference)
                                                    .toList())
                                            .where('dropdown_date',
                                                isEqualTo: dateTimeFormat(
                                                  'd/M/y',
                                                  getCurrentTimestamp,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )),
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
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          rowPhotoesRecordList.length,
                                          (rowIndex) {
                                        final rowPhotoesRecord =
                                            rowPhotoesRecordList[rowIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 4),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'ClientDetailPage',
                                                queryParams: {
                                                  'clientID': serializeParam(
                                                    rowPhotoesRecord
                                                        .parentReference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'indexTab': serializeParam(
                                                    1,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              rowPhotoesRecord
                                                                  .parentReference),
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
                                                        final rowUsersRecord =
                                                            snapshot.data!;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          12,
                                                                          0),
                                                              child: Container(
                                                                width: 50,
                                                                height: 50,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    rowUsersRecord
                                                                        .photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              rowUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 8, 12),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        rowPhotoesRecord
                                                                            .front!,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: rowPhotoesRecord
                                                                          .front!,
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    rowPhotoesRecord
                                                                        .front!,
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .network(
                                                                    rowPhotoesRecord
                                                                        .front!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        rowPhotoesRecord
                                                                            .side!,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: rowPhotoesRecord
                                                                          .side!,
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    rowPhotoesRecord
                                                                        .side!,
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .network(
                                                                    rowPhotoesRecord
                                                                        .side!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        rowPhotoesRecord
                                                                            .back!,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: rowPhotoesRecord
                                                                          .back!,
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    rowPhotoesRecord
                                                                        .back!,
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .network(
                                                                    rowPhotoesRecord
                                                                        .back!,
                                                                    fit: BoxFit
                                                                        .cover,
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
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.coachtNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: CoachtNavBarWidget(
                    page: 'CoachDashboard',
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.9, 0.7),
              child: InkWell(
                onTap: () async {
                  context.pushNamed('PlanPage');
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FFIcons.kcalendarCheck,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
