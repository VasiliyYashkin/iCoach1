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
import 'client_progress_model.dart';
export 'client_progress_model.dart';

class ClientProgressWidget extends StatefulWidget {
  const ClientProgressWidget({Key? key}) : super(key: key);

  @override
  _ClientProgressWidgetState createState() => _ClientProgressWidgetState();
}

class _ClientProgressWidgetState extends State<ClientProgressWidget> {
  late ClientProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientProgressModel());

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
              title: Text(
                'Прогресс',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          indicatorWeight: 3,
                          tabs: [
                            Tab(
                              text: 'Вес',
                            ),
                            Tab(
                              text: 'Замеры',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<WeightRecord>>(
                                    stream: queryWeightRecord(
                                      parent: currentUserReference,
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
                                                  FlutterFlowTheme.of(context)
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
                                        child: Visibility(
                                          visible: containerWeightRecordList
                                                  .length >=
                                              2,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 300,
                                              child: FlutterFlowLineChart(
                                                data: [
                                                  FFLineChartData(
                                                    xData:
                                                        containerWeightRecordList
                                                            .map((d) => d.date)
                                                            .toList(),
                                                    yData:
                                                        containerWeightRecordList
                                                            .map(
                                                                (d) => d.weight)
                                                            .toList(),
                                                    settings: LineChartBarData(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      barWidth: 1,
                                                      isCurved: true,
                                                      preventCurveOverShooting:
                                                          true,
                                                      belowBarData: BarAreaData(
                                                        show: true,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  backgroundColor: Colors.white,
                                                  showGrid: true,
                                                  showBorder: false,
                                                ),
                                                axisBounds: AxisBounds(),
                                                xAxisLabelInfo: AxisLabelInfo(
                                                  title: 'Дата',
                                                  titleTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                yAxisLabelInfo: AxisLabelInfo(
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
                                        ),
                                      );
                                    },
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 20, 16, 0),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          WeightRecord>(
                                        pagingController: () {
                                          final Query<Object?> Function(
                                                  Query<Object?>) queryBuilder =
                                              (weightRecord) =>
                                                  weightRecord.orderBy('date',
                                                      descending: true);
                                          if (_model.pagingController != null) {
                                            final query = queryBuilder(
                                                WeightRecord.collection());
                                            if (query != _model.pagingQuery) {
                                              // The query has changed
                                              _model.pagingQuery = query;
                                              _model.streamSubscriptions
                                                  .forEach((s) => s?.cancel());
                                              _model.streamSubscriptions
                                                  .clear();
                                              _model.pagingController!
                                                  .refresh();
                                            }
                                            return _model.pagingController!;
                                          }

                                          _model.pagingController =
                                              PagingController(
                                                  firstPageKey: null);
                                          _model.pagingQuery = queryBuilder(
                                              WeightRecord.collection());
                                          _model.pagingController!
                                              .addPageRequestListener(
                                                  (nextPageMarker) {
                                            queryWeightRecordPage(
                                              parent: currentUserReference,
                                              queryBuilder: (weightRecord) =>
                                                  weightRecord.orderBy('date',
                                                      descending: true),
                                              nextPageMarker: nextPageMarker,
                                              pageSize: 25,
                                              isStream: true,
                                            ).then((page) {
                                              _model.pagingController!
                                                  .appendPage(
                                                page.data,
                                                page.nextPageMarker,
                                              );
                                              final streamSubscription = page
                                                  .dataStream
                                                  ?.listen((data) {
                                                data.forEach((item) {
                                                  final itemIndexes = _model
                                                      .pagingController!
                                                      .itemList!
                                                      .asMap()
                                                      .map((k, v) => MapEntry(
                                                          v.reference.id, k));
                                                  final index = itemIndexes[
                                                      item.reference.id];
                                                  final items = _model
                                                      .pagingController!
                                                      .itemList!;
                                                  if (index != null) {
                                                    items.replaceRange(index,
                                                        index + 1, [item]);
                                                    _model.pagingController!
                                                        .itemList = {
                                                      for (var item in items)
                                                        item.reference: item
                                                    }.values.toList();
                                                  }
                                                });
                                                setState(() {});
                                              });
                                              _model.streamSubscriptions
                                                  .add(streamSubscription);
                                            });
                                          });
                                          return _model.pagingController!;
                                        }(),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                WeightRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewWeightRecord = _model
                                                .pagingController!
                                                .itemList![listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    dateTimeFormat(
                                                      'd/M/y',
                                                      listViewWeightRecord
                                                          .date!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      formatNumber(
                                                        listViewWeightRecord
                                                            .weight,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      '-',
                                                    )}кг',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          fontSize: 20,
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<MeasurementsRecord>>(
                                    stream: queryMeasurementsRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (measurementsRecord) =>
                                          measurementsRecord.orderBy('date'),
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
                                      List<MeasurementsRecord>
                                          containerMeasurementsRecordList =
                                          snapshot.data!;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible:
                                              containerMeasurementsRecordList
                                                      .length >=
                                                  2,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 300,
                                              child: Stack(
                                                children: [
                                                  FlutterFlowLineChart(
                                                    data: [
                                                      FFLineChartData(
                                                        xData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.date)
                                                                .toList(),
                                                        yData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.chest)
                                                                .toList(),
                                                        settings:
                                                            LineChartBarData(
                                                          color:
                                                              Color(0xFF3A5FFF),
                                                          barWidth: 1,
                                                          isCurved: true,
                                                          preventCurveOverShooting:
                                                              true,
                                                        ),
                                                      ),
                                                      FFLineChartData(
                                                        xData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.date)
                                                                .toList(),
                                                        yData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.waist)
                                                                .toList(),
                                                        settings:
                                                            LineChartBarData(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          barWidth: 1,
                                                          isCurved: true,
                                                          preventCurveOverShooting:
                                                              true,
                                                        ),
                                                      ),
                                                      FFLineChartData(
                                                        xData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.date)
                                                                .toList(),
                                                        yData:
                                                            containerMeasurementsRecordList
                                                                .map((d) =>
                                                                    d.hips)
                                                                .toList(),
                                                        settings:
                                                            LineChartBarData(
                                                          color:
                                                              Color(0xFFA03AFF),
                                                          barWidth: 1,
                                                          isCurved: true,
                                                          preventCurveOverShooting:
                                                              true,
                                                        ),
                                                      )
                                                    ],
                                                    chartStylingInfo:
                                                        ChartStylingInfo(
                                                      backgroundColor:
                                                          Colors.white,
                                                      showGrid: true,
                                                      showBorder: false,
                                                    ),
                                                    axisBounds: AxisBounds(
                                                      maxY: 150,
                                                    ),
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
                                                        fontSize: 10,
                                                      ),
                                                      labelInterval: 20,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1, 0.9),
                                                    child:
                                                        FlutterFlowChartLegendWidget(
                                                      entries: [
                                                        LegendEntry(
                                                            Color(0xFF3A5FFF),
                                                            'Грудь'),
                                                        LegendEntry(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                            'Талия'),
                                                        LegendEntry(
                                                            Color(0xFFA03AFF),
                                                            'Ягодицы'),
                                                      ],
                                                      width: 100,
                                                      height: 70,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                      textPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 0, 0),
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      indicatorSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Expanded(
                                    child:
                                        StreamBuilder<List<MeasurementsRecord>>(
                                      stream: queryMeasurementsRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (measurementsRecord) =>
                                            measurementsRecord.orderBy('date',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          shrinkWrap: true,
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'd/M/y',
                                                        listViewMeasurementsRecord
                                                            .date!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
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
                                                        'Key7yc_${listViewIndex}_of_${listViewMeasurementsRecordList.length}'),
                                                    measurement:
                                                        listViewMeasurementsRecord,
                                                    clientID:
                                                        currentUserReference,
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
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: wrapWithModel(
                  model: _model.clientNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: ClientNavBarWidget(
                    page: 'ClientProgress',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
