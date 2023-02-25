import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'water_tracking_component_model.dart';
export 'water_tracking_component_model.dart';

class WaterTrackingComponentWidget extends StatefulWidget {
  const WaterTrackingComponentWidget({
    Key? key,
    this.waterDoc,
    this.user,
  }) : super(key: key);

  final WaterTrackingRecord? waterDoc;
  final DocumentReference? user;

  @override
  _WaterTrackingComponentWidgetState createState() =>
      _WaterTrackingComponentWidgetState();
}

class _WaterTrackingComponentWidgetState
    extends State<WaterTrackingComponentWidget> {
  late WaterTrackingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterTrackingComponentModel());

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
      height: 100,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
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
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Text(
                'Вода',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.waterDoc != null
                          ? valueOrDefault<String>(
                              widget.waterDoc!.waterFact?.toString(),
                              '0',
                            )
                          : '0',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontSize: 18,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: Text(
                        'из',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(widget.user!),
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
                        final textUsersRecord = snapshot.data!;
                        return Text(
                          widget.waterDoc != null
                              ? valueOrDefault<String>(
                                  widget.waterDoc!.waterPlanned?.toString(),
                                  '0',
                                )
                              : valueOrDefault<String>(
                                  textUsersRecord.waterQtty?.toString(),
                                  '0',
                                ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 18,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
          ],
        ),
      ),
    );
  }
}
