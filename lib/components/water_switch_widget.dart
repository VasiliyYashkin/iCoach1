import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'water_switch_model.dart';
export 'water_switch_model.dart';

class WaterSwitchWidget extends StatefulWidget {
  const WaterSwitchWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _WaterSwitchWidgetState createState() => _WaterSwitchWidgetState();
}

class _WaterSwitchWidgetState extends State<WaterSwitchWidget> {
  late WaterSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterSwitchModel());

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
                child: StreamBuilder<UsersRecord>(
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
                    final columnUsersRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 16, 0),
                                  child: AutoSizeText(
                                    'Отслеживание воды',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .title2Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                          SwitchListTile(
                            value: _model.switchListTileValue ??=
                                columnUsersRecord.waterTracking!,
                            onChanged: (newValue) async {
                              setState(
                                  () => _model.switchListTileValue = newValue!);
                              if (newValue!) {
                                final usersUpdateData = createUsersRecordData(
                                  waterTracking: _model.switchListTileValue,
                                );
                                await widget.user!.update(usersUpdateData);
                              } else {
                                final usersUpdateData = createUsersRecordData(
                                  waterTracking: _model.switchListTileValue,
                                );
                                await widget.user!.update(usersUpdateData);
                              }
                            },
                            title: Text(
                              'Включить',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          if (!columnUsersRecord.waterTracking!)
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Lottie.asset(
                                'assets/lottie_animations/79611-water-animation.json',
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.contain,
                                animate: true,
                              ),
                            ),
                          if (columnUsersRecord.waterTracking ?? true)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: TextFormField(
                                    controller: _model.textController ??=
                                        TextEditingController(
                                      text: columnUsersRecord.waterQtty != null
                                          ? columnUsersRecord.waterQtty
                                              ?.toString()
                                          : 'Введите количество воды в мл',
                                    ),
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Введите количество воды в мл',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      suffixIcon: _model
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: wrapWithModel(
                                    model: _model.filledButtonModel,
                                    updateCallback: () => setState(() {}),
                                    child: FilledButtonWidget(
                                      buttonTitle: 'Сохранить',
                                      buttonAction: () async {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          waterQtty: int.tryParse(
                                              _model.textController.text),
                                        );
                                        await widget.user!
                                            .update(usersUpdateData);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
