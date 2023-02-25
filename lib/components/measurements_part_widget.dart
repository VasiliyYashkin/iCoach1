import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'measurements_part_model.dart';
export 'measurements_part_model.dart';

class MeasurementsPartWidget extends StatefulWidget {
  const MeasurementsPartWidget({
    Key? key,
    this.name,
    this.dateBefore,
    this.dateAfter,
    this.user,
  }) : super(key: key);

  final String? name;
  final String? dateBefore;
  final String? dateAfter;
  final DocumentReference? user;

  @override
  _MeasurementsPartWidgetState createState() => _MeasurementsPartWidgetState();
}

class _MeasurementsPartWidgetState extends State<MeasurementsPartWidget> {
  late MeasurementsPartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementsPartModel());

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

    return Visibility(
      visible: (currentUserDocument?.measurmentsSwitch?.toList() ?? [])
          .contains(widget.name),
      child: AuthUserStreamWidget(
        builder: (context) => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<List<MeasurementsRecord>>(
              stream: queryMeasurementsRecord(
                parent: widget.user,
                queryBuilder: (measurementsRecord) => measurementsRecord
                    .where('dropdown_date', isEqualTo: widget.dateBefore),
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
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<MeasurementsRecord> textMeasurementsRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final textMeasurementsRecord =
                    textMeasurementsRecordList.isNotEmpty
                        ? textMeasurementsRecordList.first
                        : null;
                return Text(
                  () {
                    if (widget.name == 'Грудь') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.chest,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Талия') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.waist,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Ягодицы') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hips,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Бедро Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hipLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Бедро П') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hipRight,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Бицепс Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.bicepsLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Бицепс П') {
                      return valueOrDefault<String>(
                        textMeasurementsRecord!.bicepsRight?.toString(),
                        '-',
                      );
                    } else if (widget.name == 'Голень Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.shinLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else if (widget.name == 'Голень П') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.shinRight,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '-',
                      );
                    } else {
                      return '0';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 18,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                );
              },
            ),
            Text(
              widget.name!,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 18,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
            StreamBuilder<List<MeasurementsRecord>>(
              stream: queryMeasurementsRecord(
                parent: widget.user,
                queryBuilder: (measurementsRecord) => measurementsRecord
                    .where('dropdown_date', isEqualTo: widget.dateAfter),
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
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<MeasurementsRecord> textMeasurementsRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final textMeasurementsRecord =
                    textMeasurementsRecordList.isNotEmpty
                        ? textMeasurementsRecordList.first
                        : null;
                return Text(
                  () {
                    if (widget.name == 'Грудь') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.chest,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Талия') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.waist,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Ягодицы') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hips,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Бедро Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hipLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Бедро П') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.hipRight,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Бицепс Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.bicepsLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Бицепс П') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.bicepsRight,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Голень Л') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.shinLeft,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else if (widget.name == 'Голень П') {
                      return valueOrDefault<String>(
                        formatNumber(
                          textMeasurementsRecord!.shinRight,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                        ),
                        '0',
                      );
                    } else {
                      return '0';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 18,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
