import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/app_logo_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registration_model.dart';
export 'registration_model.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  late RegistrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationModel());

    _model.nameController ??= TextEditingController();
    _model.emailController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.confirmPasswordController ??= TextEditingController();
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
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: wrapWithModel(
                            model: _model.appLogoModel,
                            updateCallback: () => setState(() {}),
                            child: AppLogoWidget(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: _model.nameController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.nameController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Введите Ваше Имя',
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
                              suffixIcon: _model.nameController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.nameController?.clear();
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
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            validator: _model.nameControllerValidator
                                .asValidator(context),
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
                              hintText: 'Введите Ваш email',
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
                              suffixIcon:
                                  _model.emailController!.text.isNotEmpty
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
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: _model.passwordController,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              hintText: 'Введите пароль',
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
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            keyboardType: TextInputType.visiblePassword,
                            validator: _model.passwordControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: TextFormField(
                            controller: _model.confirmPasswordController,
                            obscureText: !_model.confirmPasswordVisibility,
                            decoration: InputDecoration(
                              hintText: 'Подтвердите пароль',
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
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => _model.confirmPasswordVisibility =
                                      !_model.confirmPasswordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.confirmPasswordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                            keyboardType: TextInputType.visiblePassword,
                            validator: _model.confirmPasswordControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Я тренер',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontSize: 18,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.checkboxValue = newValue!);
                                  },
                                  activeColor: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.filledButtonModel,
                          updateCallback: () => setState(() {}),
                          child: FilledButtonWidget(
                            buttonTitle: 'Зарегистрироваться',
                            buttonAction: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              if (_model.passwordController.text !=
                                  _model.confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Пароли не совпадают',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user = await createAccountWithEmail(
                                context,
                                _model.emailController.text,
                                _model.passwordController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              final usersCreateData = createUsersRecordData(
                                displayName: _model.nameController.text,
                                isCoach: _model.checkboxValue,
                              );
                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(usersCreateData);

                              await sendEmailVerification();

                              context.goNamedAuth('ClientProgress', mounted);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('Login');
                                },
                                child: Text(
                                  'У меня уже есть аккаунт',
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
        ),
      ),
    );
  }
}
