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
import 'compare_page_model.dart';
export 'compare_page_model.dart';

class ComparePageWidget extends StatefulWidget {
  const ComparePageWidget({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  _ComparePageWidgetState createState() => _ComparePageWidgetState();
}

class _ComparePageWidgetState extends State<ComparePageWidget> {
  late ComparePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComparePageModel());

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
                'Сравнение',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      color: Colors.white,
                      fontSize: 22,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                          child: FlutterFlowDropDown<String>(
                            initialOption: _model.dropDownValue1 ??= 'Лицо',
                            options: ['Лицо', 'Профиль', 'Спина'],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue1 = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Colors.black,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            hintText: 'Выберите положение тела',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            borderWidth: 0,
                            borderRadius: 12,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: StreamBuilder<List<PhotoesRecord>>(
                                  stream: queryPhotoesRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (photoesRecord) =>
                                        photoesRecord.orderBy('created_at',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PhotoesRecord>
                                        dropDownPhotoesRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      initialOption: _model.dropDownValue2 ??=
                                          dateTimeFormat(
                                        'd/M/y',
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      options: dropDownPhotoesRecordList
                                          .map((e) => e.dropdownDate)
                                          .withoutNulls
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue2 = val),
                                      width: 150,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Colors.black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                      hintText: 'Выберите дату',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: StreamBuilder<List<PhotoesRecord>>(
                                  stream: queryPhotoesRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (photoesRecord) =>
                                        photoesRecord.orderBy('created_at',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PhotoesRecord>
                                        dropDownPhotoesRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      initialOption: _model.dropDownValue3 ??=
                                          dateTimeFormat(
                                        'd/M/y',
                                        getCurrentTimestamp,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      options: dropDownPhotoesRecordList
                                          .map((e) => e.dropdownDate)
                                          .withoutNulls
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue3 = val),
                                      width: 150,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Colors.black,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                      hintText: 'Выберите дату',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderWidth: 0,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        if ((_model.dropDownValue2 != null &&
                                _model.dropDownValue2 != '') ||
                            (_model.dropDownValue3 != null &&
                                _model.dropDownValue3 != ''))
                          wrapWithModel(
                            model: _model.photoComparsionModel,
                            updateCallback: () => setState(() {}),
                            child: PhotoComparsionWidget(
                              bodyPosition: _model.dropDownValue1,
                              dateBefore: _model.dropDownValue2,
                              dateAfter: _model.dropDownValue3,
                              user: currentUserReference,
                            ),
                          ),
                        if ((_model.dropDownValue2 != null &&
                                _model.dropDownValue2 != '') ||
                            (_model.dropDownValue3 != null &&
                                _model.dropDownValue3 != ''))
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StreamBuilder<List<WeightRecord>>(
                                      stream: queryWeightRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (weightRecord) =>
                                            weightRecord.where('dropdown_date',
                                                isEqualTo:
                                                    _model.dropDownValue2),
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
                                        List<WeightRecord>
                                            textWeightRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final textWeightRecord =
                                            textWeightRecordList.isNotEmpty
                                                ? textWeightRecordList.first
                                                : null;
                                        return Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              textWeightRecord!.weight,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            'Вес не указан',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                fontSize: 18,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        );
                                      },
                                    ),
                                    Text(
                                      'Вес',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 18,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                    StreamBuilder<List<WeightRecord>>(
                                      stream: queryWeightRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (weightRecord) =>
                                            weightRecord.where('dropdown_date',
                                                isEqualTo:
                                                    _model.dropDownValue3),
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
                                        List<WeightRecord>
                                            textWeightRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final textWeightRecord =
                                            textWeightRecordList.isNotEmpty
                                                ? textWeightRecordList.first
                                                : null;
                                        return Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              textWeightRecord!.weight,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            'Вес не указан',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                fontSize: 18,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if ((_model.dropDownValue2 != null &&
                                _model.dropDownValue2 != '') ||
                            (_model.dropDownValue3 != null &&
                                _model.dropDownValue3 != ''))
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              constraints: BoxConstraints(
                                maxHeight: 350,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel1,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Грудь',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel2,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Талия',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel3,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Ягодицы',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel4,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Бедро Л',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel5,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Бедро П',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel6,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Бицепс Л',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel7,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Бицепс П',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel8,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Голень Л',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: wrapWithModel(
                                        model: _model.measurementsPartModel9,
                                        updateCallback: () => setState(() {}),
                                        child: MeasurementsPartWidget(
                                          name: 'Голень П',
                                          dateBefore: _model.dropDownValue2,
                                          dateAfter: _model.dropDownValue3,
                                          user: currentUserReference,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.clientNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: ClientNavBarWidget(
                    page: 'ComparePage',
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
