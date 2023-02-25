import '../backend/backend.dart';
import '../components/measurements_switch_toggle_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manage_measurements_b_s_model.dart';
export 'manage_measurements_b_s_model.dart';

class ManageMeasurementsBSWidget extends StatefulWidget {
  const ManageMeasurementsBSWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _ManageMeasurementsBSWidgetState createState() =>
      _ManageMeasurementsBSWidgetState();
}

class _ManageMeasurementsBSWidgetState
    extends State<ManageMeasurementsBSWidget> {
  late ManageMeasurementsBSModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageMeasurementsBSModel());

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 3,
                        indent: 150,
                        endIndent: 150,
                        color: Color(0xFFF1F4F8),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 16, 20),
                              child: Text(
                                'Включите нужные замеры',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 28,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .title2Family),
                                    ),
                              ),
                            ),
                          ),
                        ],
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
                          final columnUsersRecord = snapshot.data!;
                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel1,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Грудь',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel2,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Талия',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel3,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Ягодицы',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel4,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Бедро Л',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel5,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Бедро П',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel6,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Бицепс Л',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel7,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Бицепс П',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.measurementsSwitchToggleModel8,
                                  updateCallback: () => setState(() {}),
                                  child: MeasurementsSwitchToggleWidget(
                                    name: 'Голень Л',
                                    user: columnUsersRecord,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: wrapWithModel(
                                    model:
                                        _model.measurementsSwitchToggleModel9,
                                    updateCallback: () => setState(() {}),
                                    child: MeasurementsSwitchToggleWidget(
                                      name: 'Голень П',
                                      user: columnUsersRecord,
                                    ),
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
