import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'measurements_model.dart';
export 'measurements_model.dart';

class MeasurementsWidget extends StatefulWidget {
  const MeasurementsWidget({
    Key? key,
    this.measurement,
    this.clientID,
  }) : super(key: key);

  final MeasurementsRecord? measurement;
  final DocumentReference? clientID;

  @override
  _MeasurementsWidgetState createState() => _MeasurementsWidgetState();
}

class _MeasurementsWidgetState extends State<MeasurementsWidget> {
  late MeasurementsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementsModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final rowUsersRecord = snapshot.data!;
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Грудь'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Грудь',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.chest,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Талия'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Талия',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.waist,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Ягодицы'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ягодицы',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.hips,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Бедро Л'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Бедро Л',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.hipLeft,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Бедро П'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Бедро П',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.hipRight,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
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
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Бицепс Л'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Бицепс Л',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.bicepsLeft,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Бицепс П'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Бицепс П',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.bicepsRight,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Голень Л'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Голень Л',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.shinLeft,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                      if (rowUsersRecord.measurmentsSwitch!
                          .toList()
                          .contains('Голень П'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Голень П',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    widget.measurement!.shinRight,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
