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
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailFielController ??= TextEditingController();
    _model.passeordFieldController ??= TextEditingController();
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: wrapWithModel(
                          model: _model.appLogoModel,
                          updateCallback: () => setState(() {}),
                          child: AppLogoWidget(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: TextFormField(
                        controller: _model.emailFielController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.emailFielController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Ведите email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          suffixIcon:
                              _model.emailFielController!.text.isNotEmpty
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.emailFielControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: TextFormField(
                        controller: _model.passeordFieldController,
                        obscureText: !_model.passeordFieldVisibility,
                        decoration: InputDecoration(
                          hintText: 'Ведите пароль',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passeordFieldVisibility =
                                  !_model.passeordFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passeordFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: _model.passeordFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.filledButtonModel,
                      updateCallback: () => setState(() {}),
                      child: FilledButtonWidget(
                        buttonTitle: 'Войти',
                        buttonAction: () async {
                          GoRouter.of(context).prepareAuthEvent();

                          final user = await signInWithEmail(
                            context,
                            _model.emailFielController.text,
                            _model.passeordFieldController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          context.goNamedAuth('ClientProgress', mounted);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed('ResetPassword');
                            },
                            child: Text(
                              'Забыли пароль?',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
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
