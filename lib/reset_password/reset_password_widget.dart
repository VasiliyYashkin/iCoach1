import '../auth/auth_util.dart';
import '../components/app_logo_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_password_model.dart';
export 'reset_password_model.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  late ResetPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordModel());

    _model.emailFielController ??= TextEditingController();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: wrapWithModel(
                                model: _model.appLogoModel,
                                updateCallback: () => setState(() {}),
                                child: AppLogoWidget(),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: TextFormField(
                              controller: _model.emailFielController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.emailFielController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Ведите email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                                suffixIcon: _model
                                        .emailFielController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.emailFielController?.clear();
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.emailFielControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.filledButtonModel,
                            updateCallback: () => setState(() {}),
                            child: FilledButtonWidget(
                              buttonTitle: 'Восстановить пароль',
                              buttonAction: () async {
                                if (_model.emailFielController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Введите email',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                await resetPassword(
                                  email: _model.emailFielController.text,
                                  context: context,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    context.pushNamed('Registration');
                                  },
                                  child: Text(
                                    'Зарегистрироваться',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    context.pushNamed('Registration');
                                  },
                                  child: Text(
                                    'Забыли пароль?',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
