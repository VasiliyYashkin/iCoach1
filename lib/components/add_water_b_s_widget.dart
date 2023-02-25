import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_water_b_s_model.dart';
export 'add_water_b_s_model.dart';

class AddWaterBSWidget extends StatefulWidget {
  const AddWaterBSWidget({
    Key? key,
    this.waterTrackingDoc,
    this.date,
  }) : super(key: key);

  final WaterTrackingRecord? waterTrackingDoc;
  final DateTime? date;

  @override
  _AddWaterBSWidgetState createState() => _AddWaterBSWidgetState();
}

class _AddWaterBSWidgetState extends State<AddWaterBSWidget> {
  late AddWaterBSModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddWaterBSModel());

    _model.textController ??= TextEditingController();
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 16, 0),
                              child: Text(
                                'Впишите количество воды',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: TextFormField(
                          controller: _model.textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Введите кол. мл',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
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
                          style: FlutterFlowTheme.of(context).bodyText1,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 50),
                        child: wrapWithModel(
                          model: _model.filledButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FilledButtonWidget(
                            buttonTitle: 'Сохранить',
                            buttonAction: () async {
                              if (widget.waterTrackingDoc != null) {
                                final waterTrackingUpdateData = {
                                  'water_fact': FieldValue.increment(
                                      int.parse(_model.textController.text)),
                                };
                                await widget.waterTrackingDoc!.reference
                                    .update(waterTrackingUpdateData);
                              } else {
                                final waterTrackingCreateData =
                                    createWaterTrackingRecordData(
                                  date: widget.date,
                                  waterFact: valueOrDefault<int>(
                                    int.tryParse(_model.textController.text),
                                    0,
                                  ),
                                  waterPlanned: valueOrDefault(
                                      currentUserDocument?.waterQtty, 0),
                                  dateString: dateTimeFormat(
                                    'd/M/y',
                                    widget.date,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                );
                                await WaterTrackingRecord.createDoc(
                                        currentUserReference!)
                                    .set(waterTrackingCreateData);
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
