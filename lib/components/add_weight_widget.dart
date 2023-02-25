import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
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
import 'add_weight_model.dart';
export 'add_weight_model.dart';

class AddWeightWidget extends StatefulWidget {
  const AddWeightWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _AddWeightWidgetState createState() => _AddWeightWidgetState();
}

class _AddWeightWidgetState extends State<AddWeightWidget> {
  late AddWeightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddWeightModel());

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                    child: Text(
                      'Введите текущий вес',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: wrapWithModel(
                      model: _model.chooseDateModel,
                      updateCallback: () => setState(() {}),
                      child: ChooseDateWidget(
                        date: valueOrDefault<String>(
                          dateTimeFormat(
                            'd/M/y',
                            _model.datePicked,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          'Выберите дату',
                        ),
                        datePickerAction: () async {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
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
                      controller: _model.textController,
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
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: StreamBuilder<List<WeightRecord>>(
                      stream: queryWeightRecord(
                        parent: currentUserReference,
                        queryBuilder: (weightRecord) => weightRecord.where(
                            'dropdown_date',
                            isEqualTo: dateTimeFormat(
                              'd/M/y',
                              _model.datePicked,
                              locale: FFLocalizations.of(context).languageCode,
                            )),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<WeightRecord> filledButtonWeightRecordList =
                            snapshot.data!;
                        final filledButtonWeightRecord =
                            filledButtonWeightRecordList.isNotEmpty
                                ? filledButtonWeightRecordList.first
                                : null;
                        return wrapWithModel(
                          model: _model.filledButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FilledButtonWidget(
                            buttonTitle: 'Сохранить',
                            buttonAction: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.datePicked == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Упс...'),
                                      content: Text('Выберите дату'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return;
                              }
                              if (filledButtonWeightRecord != null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Упс...'),
                                      content: Text(
                                          'На выбранную дату уже добавлен вес'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                if (_model.datePicked != null) {
                                  if (_model.datePicked! >
                                      getCurrentTimestamp) {
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
                                    return;
                                  } else {
                                    final weightCreateData =
                                        createWeightRecordData(
                                      createdAt: getCurrentTimestamp,
                                      createdBy: currentUserReference,
                                      weight: functions.commaToDot(
                                          _model.textController.text),
                                      date: _model.datePicked,
                                      dropdownDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                    );
                                    await WeightRecord.createDoc(widget.user!)
                                        .set(weightCreateData);
                                    Navigator.pop(context);
                                  }

                                  if (currentUserDocument!.coachRef != null) {
                                    triggerPushNotification(
                                      notificationTitle: 'Взвешивание',
                                      notificationText:
                                          '${currentUserDisplayName} внес(-ла) новый вес: ${_model.textController.text} кг',
                                      notificationImageUrl: currentUserPhoto,
                                      notificationSound: 'default',
                                      userRefs: [
                                        currentUserDocument!.coachRef!
                                      ],
                                      initialPageName: 'Dashboard',
                                      parameterData: {},
                                    );
                                    return;
                                  } else {
                                    return;
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Упс..'),
                                        content: Text('Выберите дату'),
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
                                }
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
