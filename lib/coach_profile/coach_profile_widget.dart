import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_avatar_bottomsheet_widget.dart';
import '../components/add_avatar_comp_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/coacht_nav_bar_widget.dart';
import '../components/contact_data_widget.dart';
import '../components/edit_contact_data_widget.dart';
import '../components/outline_button_widget.dart';
import '../components/trainer_q_r_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coach_profile_model.dart';
export 'coach_profile_model.dart';

class CoachProfileWidget extends StatefulWidget {
  const CoachProfileWidget({Key? key}) : super(key: key);

  @override
  _CoachProfileWidgetState createState() => _CoachProfileWidgetState();
}

class _CoachProfileWidgetState extends State<CoachProfileWidget> {
  late CoachProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachProfileModel());

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 163.9,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child:
                                                    AddAvatarBottomsheetWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: wrapWithModel(
                                          model: _model.addAvatarCompModel,
                                          updateCallback: () => setState(() {}),
                                          child: AddAvatarCompWidget(
                                            photoPath: valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                            ),
                                            imgSize: 80,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 18,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Spacer(),
                                  StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where('coach_ref',
                                              isEqualTo: currentUserReference),
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
                                      List<UsersRecord> iconUsersRecordList =
                                          snapshot.data!;
                                      return InkWell(
                                        onTap: () async {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.fullAccess,
                                              false)) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: TrainerQRWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          } else {
                                            if (iconUsersRecordList.length >=
                                                5) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Упс...'),
                                                    content: Text(
                                                        'Вы достигли лимита на добавление клиентов. Это ограничение установлено на период тестирование приложения'),
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
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: TrainerQRWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }
                                          }
                                        },
                                        child: Icon(
                                          Icons.qr_code_rounded,
                                          color: Colors.black,
                                          size: 32,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.contactDataModel,
                            updateCallback: () => setState(() {}),
                            child: ContactDataWidget(
                              email: currentUserEmail,
                              phoneNumber: currentPhoneNumber,
                              user: currentUserReference,
                              editData: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: EditContactDataWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: wrapWithModel(
                            model: _model.addMenuComponentModel,
                            updateCallback: () => setState(() {}),
                            child: AddMenuComponentWidget(
                              title: 'Обратная связь',
                              icon: FaIcon(
                                FontAwesomeIcons.questionCircle,
                              ),
                              action: () async {
                                await launchURL(
                                    'https://t.me/+EDyc37X9-zA0Njli');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                wrapWithModel(
                                  model: _model.outlineButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: OutlineButtonWidget(
                                    buttonTitle: 'Выйти',
                                    buttonAction: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await signOut();

                                      context.goNamedAuth(
                                          'Onboarding', mounted);
                                    },
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
                wrapWithModel(
                  model: _model.coachtNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: CoachtNavBarWidget(
                    page: 'CoachProfile',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
