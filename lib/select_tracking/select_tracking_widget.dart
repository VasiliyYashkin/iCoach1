import '../backend/backend.dart';
import '../components/manage_measurements_b_s_widget.dart';
import '../components/tracking_page_container_widget.dart';
import '../components/under_construction_widget.dart';
import '../components/water_switch_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_tracking_model.dart';
export 'select_tracking_model.dart';

class SelectTrackingWidget extends StatefulWidget {
  const SelectTrackingWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _SelectTrackingWidgetState createState() => _SelectTrackingWidgetState();
}

class _SelectTrackingWidgetState extends State<SelectTrackingWidget> {
  late SelectTrackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectTrackingModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.user!),
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
        final selectTrackingUsersRecord = snapshot.data!;
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
                    'Включить трекинг',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          color: Colors.white,
                          fontSize: 20,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.trackingPageContainerModel1,
                      updateCallback: () => setState(() {}),
                      child: TrackingPageContainerWidget(
                        title: 'Воды',
                        navigation: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: WaterSwitchWidget(
                                  user: widget.user,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.trackingPageContainerModel2,
                      updateCallback: () => setState(() {}),
                      child: TrackingPageContainerWidget(
                        title: 'Замеров',
                        navigation: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: ManageMeasurementsBSWidget(
                                  user: widget.user,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.trackingPageContainerModel3,
                      updateCallback: () => setState(() {}),
                      child: TrackingPageContainerWidget(
                        title: 'Тренировок',
                        navigation: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: UnderConstructionWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.trackingPageContainerModel4,
                      updateCallback: () => setState(() {}),
                      child: TrackingPageContainerWidget(
                        title: 'Питания',
                        navigation: () async {
                          context.pushNamed(
                            'MealTrackingSwitch',
                            queryParams: {
                              'user': serializeParam(
                                selectTrackingUsersRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'user': selectTrackingUsersRecord,
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
