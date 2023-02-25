import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_weight_model.dart';
export 'edit_weight_model.dart';

class EditWeightWidget extends StatefulWidget {
  const EditWeightWidget({
    Key? key,
    this.weightDocument,
  }) : super(key: key);

  final DocumentReference? weightDocument;

  @override
  _EditWeightWidgetState createState() => _EditWeightWidgetState();
}

class _EditWeightWidgetState extends State<EditWeightWidget> {
  late EditWeightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditWeightModel());

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
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: StreamBuilder<WeightRecord>(
                stream: WeightRecord.getDocument(widget.weightDocument!),
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
                  final columnWeightRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                        child: Text(
                          'Внесите правки',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                      Row(
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: wrapWithModel(
                          model: _model.chooseDateModel,
                          updateCallback: () => setState(() {}),
                          child: ChooseDateWidget(
                            date: _model.datePicked != null
                                ? dateTimeFormat(
                                    'd/M/y',
                                    _model.datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                : columnWeightRecord.dropdownDate,
                            datePickerAction: () async {
                              final _datePickedDate = await showDatePicker(
                                context: context,
                                initialDate: columnWeightRecord.date!,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                              );

                              if (_datePickedDate != null) {
                                setState(() {
                                  _model.datePicked = DateTime(
                                    _datePickedDate.year,
                                    _datePickedDate.month,
                                    _datePickedDate.day,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: TextFormField(
                          controller: _model.textController ??=
                              TextEditingController(
                            text: columnWeightRecord.weight?.toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Вес в килограммах',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
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
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: wrapWithModel(
                          model: _model.filledButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FilledButtonWidget(
                            buttonTitle: 'Сохранить',
                            buttonAction: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.datePicked != null) {
                                if (_model.datePicked! > getCurrentTimestamp) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Упс...'),
                                        content: Text(
                                            'Нельзя выбирать будущую дату'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  final weightUpdateData1 =
                                      createWeightRecordData(
                                    weight: functions
                                        .commaToDot(_model.textController.text),
                                    date: _model.datePicked,
                                    dropdownDate: dateTimeFormat(
                                      'd/M/y',
                                      _model.datePicked,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                  );
                                  await widget.weightDocument!
                                      .update(weightUpdateData1);
                                }
                              } else {
                                final weightUpdateData2 =
                                    createWeightRecordData(
                                  weight: double.tryParse(
                                      _model.textController.text),
                                );
                                await widget.weightDocument!
                                    .update(weightUpdateData2);
                              }

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
