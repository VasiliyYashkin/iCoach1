import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../components/manage_measurements_b_s_widget.dart';
import '../components/turn_on_measurements_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_measurements_model.dart';
export 'edit_measurements_model.dart';

class EditMeasurementsWidget extends StatefulWidget {
  const EditMeasurementsWidget({
    Key? key,
    this.user,
    this.measurementsDoc,
  }) : super(key: key);

  final DocumentReference? user;
  final DocumentReference? measurementsDoc;

  @override
  _EditMeasurementsWidgetState createState() => _EditMeasurementsWidgetState();
}

class _EditMeasurementsWidgetState extends State<EditMeasurementsWidget> {
  late EditMeasurementsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMeasurementsModel());

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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: StreamBuilder<MeasurementsRecord>(
                    stream:
                        MeasurementsRecord.getDocument(widget.measurementsDoc!),
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
                      final columnMeasurementsRecord = snapshot.data!;
                      return SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Container(
                                    width: 50,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                              child: Text(
                                'Отредактируйте замеры',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
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
                                0)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: wrapWithModel(
                                        model: _model.chooseDateModel,
                                        updateCallback: () => setState(() {}),
                                        child: ChooseDateWidget(
                                          date: valueOrDefault<String>(
                                            _model.datePicked != null
                                                ? dateTimeFormat(
                                                    'd/M/y',
                                                    _model.datePicked,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : columnMeasurementsRecord
                                                    .dropdownDate,
                                            '-',
                                          ),
                                          datePickerAction: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
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
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
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
                                            controller:
                                                _model.chestController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .chest,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                            controller:
                                                _model.waistController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .waist,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.buttocksController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord.hips,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.buttocksController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Обхват бёдер',
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.hipLeftController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .hipLeft,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.hipRightController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .bicepsRight,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.bicepsLeftController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .bicepsLeft,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.bicepsRightController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .bicepsRight,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.shinLeftController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .shinLeft,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
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
                                                _model.shinRightController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  columnMeasurementsRecord
                                                      .shinRight,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                ),
                                                '0',
                                              ),
                                            ),
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
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                signed: true, decimal: true),
                                            validator: _model
                                                .shinRightControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 50),
                                    child: wrapWithModel(
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
                                              final measurementsUpdateData1 =
                                                  createMeasurementsRecordData(
                                                chest: double.tryParse(_model
                                                    .chestController.text),
                                                waist: double.tryParse(_model
                                                    .waistController.text),
                                                hips: double.tryParse(_model
                                                    .buttocksController.text),
                                                hipLeft: double.tryParse(_model
                                                    .hipLeftController.text),
                                                hipRight: double.tryParse(_model
                                                    .hipRightController.text),
                                                bicepsLeft: double.tryParse(
                                                    _model.bicepsLeftController
                                                        .text),
                                                bicepsRight: double.tryParse(
                                                    _model.bicepsRightController
                                                        .text),
                                                shinLeft: double.tryParse(_model
                                                    .shinLeftController.text),
                                                shinRight: double.tryParse(
                                                    _model.shinRightController
                                                        .text),
                                                dropdownDate: dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                date: _model.datePicked,
                                              );
                                              await columnMeasurementsRecord
                                                  .reference
                                                  .update(
                                                      measurementsUpdateData1);
                                            }
                                          } else {
                                            final measurementsUpdateData2 =
                                                createMeasurementsRecordData(
                                              chest: double.tryParse(
                                                  _model.chestController.text),
                                              waist: double.tryParse(
                                                  _model.waistController.text),
                                              hips: double.tryParse(_model
                                                  .buttocksController.text),
                                              hipLeft: double.tryParse(_model
                                                  .hipLeftController.text),
                                              hipRight: double.tryParse(_model
                                                  .hipRightController.text),
                                              bicepsLeft: double.tryParse(_model
                                                  .bicepsLeftController.text),
                                              bicepsRight: double.tryParse(
                                                  _model.bicepsRightController
                                                      .text),
                                              shinLeft: double.tryParse(_model
                                                  .shinLeftController.text),
                                              shinRight: double.tryParse(_model
                                                  .shinRightController.text),
                                            );
                                            await columnMeasurementsRecord
                                                .reference
                                                .update(
                                                    measurementsUpdateData2);
                                          }

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (containerUsersRecord.measurmentsSwitch!
                                    .toList()
                                    .length ==
                                0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 30),
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
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: ManageMeasurementsBSWidget(
                                              user: widget.user,
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
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
