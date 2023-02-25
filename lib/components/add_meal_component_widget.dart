import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_meal_component_model.dart';
export 'add_meal_component_model.dart';

class AddMealComponentWidget extends StatefulWidget {
  const AddMealComponentWidget({
    Key? key,
    this.mealTrackingDoc,
    this.date,
  }) : super(key: key);

  final MealTrackingRecord? mealTrackingDoc;
  final DateTime? date;

  @override
  _AddMealComponentWidgetState createState() => _AddMealComponentWidgetState();
}

class _AddMealComponentWidgetState extends State<AddMealComponentWidget> {
  late AddMealComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMealComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 3,
                indent: 150,
                endIndent: 150,
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF44BB48),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Белки - г',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5C7AFF),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Жиры - г',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Углеводы - г',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: 150,
                                    child: FlutterFlowPieChart(
                                      data: FFPieChartData(
                                        values: [
                                          random_data.randomInteger(0, 10),
                                          random_data.randomInteger(0, 10),
                                          random_data.randomInteger(0, 10)
                                        ],
                                        colors: [
                                          Color(0xFF44BB48),
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          FlutterFlowTheme.of(context).alternate
                                        ],
                                        radius: [30, 30, 30],
                                      ),
                                      donutHoleRadius: 30,
                                      sectionLabelType:
                                          PieChartSectionLabelType.percent,
                                      sectionLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .title3
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .title3Family,
                                            fontSize: 14,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .title3Family),
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      '3200',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 12,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController1',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.proteins = double.tryParse(
                                              _model.textController1.text);
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Белки',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController2',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.fats = double.tryParse(
                                              _model.textController2.text);
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Жиры',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: TextFormField(
                                  controller: _model.textController3,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      _model.carbs = _model.carbs;
                                    });
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Углеводы',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Container(
                                  width: 170,
                                  height: 170,
                                  child: FlutterFlowPieChart(
                                    data: FFPieChartData(
                                      values: [
                                        random_data.randomInteger(0, 10),
                                        random_data.randomInteger(0, 10),
                                        random_data.randomInteger(0, 10)
                                      ],
                                      colors: [
                                        Color(0xFF44BB48),
                                        FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        FlutterFlowTheme.of(context).alternate
                                      ],
                                      radius: [30, 30, 30],
                                    ),
                                    donutHoleRadius: 30,
                                    sectionLabelType:
                                        PieChartSectionLabelType.percent,
                                    sectionLabelStyle: FlutterFlowTheme.of(
                                            context)
                                        .title3
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .title3Family,
                                          fontSize: 14,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family),
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '3200',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          fontSize: 12,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 50),
                        child: wrapWithModel(
                          model: _model.filledButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FilledButtonWidget(
                            buttonTitle: 'Сохранить',
                            buttonAction: () async {
                              setState(() {});
                              if (widget.mealTrackingDoc != null) {
                                final mealTrackingUpdateData = {
                                  'prot_fact': FieldValue.increment(
                                      double.parse(
                                          _model.textController1.text)),
                                  'carbs_fact': FieldValue.increment(
                                      double.parse(
                                          _model.textController3.text)),
                                  'fats_fact': FieldValue.increment(
                                      double.parse(
                                          _model.textController2.text)),
                                };
                                await widget.mealTrackingDoc!.reference
                                    .update(mealTrackingUpdateData);
                              } else {
                                final mealTrackingCreateData =
                                    createMealTrackingRecordData(
                                  date: widget.date,
                                  dateString: dateTimeFormat(
                                    'd/M/y',
                                    widget.date,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  protPlanned: currentUserDocument!
                                      .mealTracking.porteins,
                                  protFact: double.tryParse(
                                      _model.textController1.text),
                                  carbsPlanned:
                                      currentUserDocument!.mealTracking.carbs,
                                  carbsFact: double.tryParse(
                                      _model.textController3.text),
                                  caloriesPlanned: currentUserDocument!
                                      .mealTracking.calories
                                      ?.toDouble(),
                                  caloriesFact: valueOrDefault<double>(
                                    functions.nutrientsToCalories(
                                        double.tryParse(
                                            _model.textController1.text),
                                        double.tryParse(
                                            _model.textController2.text),
                                        double.tryParse(
                                            _model.textController3.text)),
                                    0.0,
                                  ),
                                  protPercentage:
                                      functions.howMuchProtAndCarbInCal(
                                          _model.caloriesFact!,
                                          _model.proteins!),
                                  fatsPercentage: functions.howMuchFatsInCal(
                                      _model.caloriesFact!, _model.fats!),
                                  carbsPercentage:
                                      functions.howMuchProtAndCarbInCal(
                                          _model.caloriesFact!, _model.carbs!),
                                  fatsPlanned:
                                      currentUserDocument!.mealTracking.fats,
                                  fatsFact: double.tryParse(
                                      _model.textController2.text),
                                  protPercentagePlanned: currentUserDocument!
                                      .mealTracking.protPercentage
                                      ?.toDouble(),
                                  fatsPercentagePlanned: currentUserDocument!
                                      .mealTracking.fatsPercentage
                                      ?.toDouble(),
                                  carbsPercentagePlanned: currentUserDocument!
                                      .mealTracking.carbsPercentage
                                      ?.toDouble(),
                                );
                                await MealTrackingRecord.createDoc(
                                        currentUserReference!)
                                    .set(mealTrackingCreateData);
                              }

                              Navigator.pop(context);
                            },
                          ),
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
    );
  }
}
