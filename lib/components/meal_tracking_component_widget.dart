import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meal_tracking_component_model.dart';
export 'meal_tracking_component_model.dart';

class MealTrackingComponentWidget extends StatefulWidget {
  const MealTrackingComponentWidget({
    Key? key,
    this.user,
    this.mealTrckingDoc,
  }) : super(key: key);

  final DocumentReference? user;
  final MealTrackingRecord? mealTrckingDoc;

  @override
  _MealTrackingComponentWidgetState createState() =>
      _MealTrackingComponentWidgetState();
}

class _MealTrackingComponentWidgetState
    extends State<MealTrackingComponentWidget> {
  late MealTrackingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealTrackingComponentModel());

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

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF44BB48),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Text(
                        'Белки - ${widget.mealTrckingDoc != null ? valueOrDefault<String>(
                            widget.mealTrckingDoc!.protFact?.toString(),
                            '0',
                          ) : '0'}г',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF5C7AFF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Text(
                        'Жиры - ${widget.mealTrckingDoc != null ? valueOrDefault<String>(
                            widget.mealTrckingDoc!.fatsFact?.toString(),
                            '0',
                          ) : '0'}г',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Text(
                        'Углеводы - ${widget.mealTrckingDoc != null ? valueOrDefault<String>(
                            widget.mealTrckingDoc!.carbsFact?.toString(),
                            '0',
                          ) : '0'}г',
                        style: FlutterFlowTheme.of(context).bodyText1,
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
                        formatNumber(
                          widget.mealTrckingDoc != null ? 55.0 : 44.0,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        random_data.randomInteger(0, 10),
                        random_data.randomInteger(0, 10)
                      ],
                      colors: [
                        Color(0xFF44BB48),
                        FlutterFlowTheme.of(context).secondaryColor,
                        FlutterFlowTheme.of(context).alternate
                      ],
                      radius: [30, 30, 30],
                    ),
                    donutHoleRadius: 30,
                    sectionLabelType: PieChartSectionLabelType.percent,
                    sectionLabelStyle: FlutterFlowTheme.of(context)
                        .title3
                        .override(
                          fontFamily: FlutterFlowTheme.of(context).title3Family,
                          fontSize: 14,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title3Family),
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    widget.mealTrckingDoc != null
                        ? valueOrDefault<String>(
                            widget.mealTrckingDoc!.caloriesFact?.toString(),
                            '0',
                          )
                        : '0',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 12,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
