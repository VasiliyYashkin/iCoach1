import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../components/manage_measurements_b_s_widget.dart';
import '../components/turn_on_measurements_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_measurements_model.dart';
export 'add_measurements_model.dart';

class AddMeasurementsWidget extends StatefulWidget {
  const AddMeasurementsWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _AddMeasurementsWidgetState createState() => _AddMeasurementsWidgetState();
}

class _AddMeasurementsWidgetState extends State<AddMeasurementsWidget> {
  late AddMeasurementsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMeasurementsModel());

    _model.chestController ??= TextEditingController();
    _model.waistController ??= TextEditingController();
    _model.buttocksController ??= TextEditingController();
    _model.hipLeftController ??= TextEditingController();
    _model.hipRightController ??= TextEditingController();
    _model.bicepsLeftController ??= TextEditingController();
    _model.bicepsRightController ??= TextEditingController();
    _model.shinLeftController ??= TextEditingController();
    _model.shinRightController ??= TextEditingController();
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
              final containerUsersRecord = snapshot.data!;
              return Material(
                color: Colors.transparent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.85,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 0, 16),
                            child: Text(
                              'Введите замеры',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title1Family,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title1Family),
                                      ),
                            ),
                          ),
                          if (containerUsersRecord.measurmentsSwitch!
                                  .toList()
                                  .length >
                              1)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 18),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Дата',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Expanded(
                                          child: wrapWithModel(
                                            model: _model.chooseDateModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ChooseDateWidget(
                                              date: valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Выберите дату',
                                              ),
                                              datePickerAction: () async {
                                                final _datePickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2050),
                                                );

                                                if (_datePickedDate != null) {
                                                  setState(() {
                                                    _model.datePicked =
                                                        DateTime(
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
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Грудь'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller: _model.chestController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.chestController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват груди',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .chestController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model.chestController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .chestControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Талия'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller: _model.waistController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.waistController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват талии',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .waistController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model.waistController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .waistControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Ягодицы'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.buttocksController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.buttocksController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват ягодиц',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .buttocksController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .buttocksController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .buttocksControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Бедро Л'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.hipLeftController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.hipLeftController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват левого бедра',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .hipLeftController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model.hipLeftController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .hipLeftControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Бедро П'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.hipRightController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.hipRightController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват правого бедра',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .hipRightController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .hipRightController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .hipRightControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Бицепс Л'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.bicepsLeftController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.bicepsLeftController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват левого бицепса',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .bicepsLeftController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .bicepsLeftController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .bicepsLeftControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Бицепс П'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.bicepsRightController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.bicepsRightController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Обхват правого бицепса',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .bicepsRightController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .bicepsRightController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .bicepsRightControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Голень Л'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.shinLeftController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.shinLeftController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват левой голени',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .shinLeftController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .shinLeftController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .shinLeftControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      if (containerUsersRecord
                                          .measurmentsSwitch!
                                          .toList()
                                          .contains('Голень П'))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: TextFormField(
                                            controller:
                                                _model.shinRightController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.shinRightController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват правой голени',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon: _model
                                                      .shinRightController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .shinRightController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .shinRightControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 30),
                                    child:
                                        StreamBuilder<List<MeasurementsRecord>>(
                                      stream: queryMeasurementsRecord(
                                        parent: currentUserReference,
                                        queryBuilder: (measurementsRecord) =>
                                            measurementsRecord.where(
                                                'dropdown_date',
                                                isEqualTo: dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        List<MeasurementsRecord>
                                            filledButtonMeasurementsRecordList =
                                            snapshot.data!;
                                        final filledButtonMeasurementsRecord =
                                            filledButtonMeasurementsRecordList
                                                    .isNotEmpty
                                                ? filledButtonMeasurementsRecordList
                                                    .first
                                                : null;
                                        return wrapWithModel(
                                          model: _model.filledButtonModel,
                                          updateCallback: () => setState(() {}),
                                          child: FilledButtonWidget(
                                            buttonTitle: 'Сохранить',
                                            buttonAction: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model.datePicked != null) {
                                                if (filledButtonMeasurementsRecord !=
                                                    null) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Упс...'),
                                                        content: Text(
                                                            'Замеры в текущую дату уже добавлены'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  if (_model.datePicked! >
                                                      getCurrentTimestamp) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Упс...'),
                                                          content: Text(
                                                              'Нельзя выбирать будущую дату'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  } else {
                                                    final measurementsCreateData =
                                                        createMeasurementsRecordData(
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      createdBy:
                                                          currentUserReference,
                                                      chest: double.tryParse(
                                                          _model.chestController
                                                              .text),
                                                      waist: double.tryParse(
                                                          _model.waistController
                                                              .text),
                                                      hips: double.tryParse(
                                                          _model
                                                              .buttocksController
                                                              .text),
                                                      dropdownDate:
                                                          dateTimeFormat(
                                                        'd/M/y',
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      date: _model.datePicked,
                                                      hipLeft: double.tryParse(
                                                          _model
                                                              .hipLeftController
                                                              .text),
                                                      hipRight: double.tryParse(
                                                          _model
                                                              .hipRightController
                                                              .text),
                                                      bicepsLeft:
                                                          double.tryParse(_model
                                                              .bicepsLeftController
                                                              .text),
                                                      bicepsRight:
                                                          double.tryParse(_model
                                                              .bicepsRightController
                                                              .text),
                                                      shinLeft: double.tryParse(
                                                          _model
                                                              .shinLeftController
                                                              .text),
                                                      shinRight:
                                                          double.tryParse(_model
                                                              .shinRightController
                                                              .text),
                                                    );
                                                    await MeasurementsRecord
                                                            .createDoc(
                                                                widget.user!)
                                                        .set(
                                                            measurementsCreateData);
                                                    Navigator.pop(context);
                                                    if (currentUserDocument!
                                                            .coachRef !=
                                                        null) {
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Замеры',
                                                        notificationText:
                                                            '${currentUserDisplayName} внес(-ла) новые замеры: ${_model.chestController.text}см ${_model.waistController.text} см${_model.buttocksController.text} см',
                                                        notificationImageUrl:
                                                            currentUserPhoto,
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          currentUserDocument!
                                                              .coachRef!
                                                        ],
                                                        initialPageName:
                                                            'Dashboard',
                                                        parameterData: {},
                                                      );
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  }
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Упс...'),
                                                      content:
                                                          Text('Выберите дату'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
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
                          if (containerUsersRecord.measurmentsSwitch!
                                  .toList()
                                  .length ==
                              0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 30),
                              child: wrapWithModel(
                                model: _model.turnOnMeasurementsModel,
                                updateCallback: () => setState(() {}),
                                child: TurnOnMeasurementsWidget(
                                  user: widget.user,
                                  navigate: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: ManageMeasurementsBSWidget(
                                            user:
                                                containerUsersRecord.reference,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
