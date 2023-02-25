import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_contact_data_model.dart';
export 'edit_contact_data_model.dart';

class EditContactDataWidget extends StatefulWidget {
  const EditContactDataWidget({Key? key}) : super(key: key);

  @override
  _EditContactDataWidgetState createState() => _EditContactDataWidgetState();
}

class _EditContactDataWidgetState extends State<EditContactDataWidget> {
  late EditContactDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditContactDataModel());

    _model.emailController ??= TextEditingController(
        text: valueOrDefault<String>(
      currentUserEmail,
      'Email не указан',
    ));
    _model.phoneController ??= TextEditingController(
        text: valueOrDefault<String>(
      currentPhoneNumber,
      'Номер телефона не указан',
    ));
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
          child: Container(
            width: double.infinity,
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 40),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                color: FlutterFlowTheme.of(context).lineColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 16),
                        child: Text(
                          'Редактирование контактных данных',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title1Family,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).title1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: TextFormField(
                          controller: _model.emailController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.emailController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
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
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: _model.emailController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.emailController?.clear();
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
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.phoneController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.phoneController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon:
                                  _model.phoneController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.phoneController?.clear();
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
                            keyboardType: TextInputType.phone,
                            validator: _model.phoneControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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

                              final usersUpdateData = createUsersRecordData(
                                email: _model.emailController.text,
                                phoneNumber: _model.phoneController.text,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              Navigator.pop(context);
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
      ),
    );
  }
}
