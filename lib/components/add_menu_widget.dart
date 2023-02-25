import '../components/add_measurements_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/add_weight_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_menu_model.dart';
export 'add_menu_model.dart';

class AddMenuWidget extends StatefulWidget {
  const AddMenuWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _AddMenuWidgetState createState() => _AddMenuWidgetState();
}

class _AddMenuWidgetState extends State<AddMenuWidget> {
  late AddMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMenuModel());

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
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: wrapWithModel(
                        model: _model.addMenuComponentModel1,
                        updateCallback: () => setState(() {}),
                        child: AddMenuComponentWidget(
                          title: 'Добавить вес',
                          icon: FaIcon(
                            FontAwesomeIcons.weight,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                          action: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: AddWeightWidget(
                                    user: widget.user,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: wrapWithModel(
                        model: _model.addMenuComponentModel2,
                        updateCallback: () => setState(() {}),
                        child: AddMenuComponentWidget(
                          title: 'Добавить замеры',
                          icon: Icon(
                            FFIcons.krulerVertical,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                          action: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: AddMeasurementsWidget(
                                    user: widget.user,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: wrapWithModel(
                        model: _model.addMenuComponentModel3,
                        updateCallback: () => setState(() {}),
                        child: AddMenuComponentWidget(
                          title: 'Добавить фото',
                          icon: Icon(
                            Icons.photo_camera,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                          action: () async {
                            context.pushNamed(
                              'AddPhotoesPage',
                              queryParams: {
                                'user': serializeParam(
                                  widget.user,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
