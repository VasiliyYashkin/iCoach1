import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_coach_bottom_sheet_widget.dart';
import '../components/add_menu_component_widget.dart';
import '../components/coach_card_widget.dart';
import '../components/contact_data_widget.dart';
import '../components/edit_contact_data_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_page_model.dart';
export 'check_page_model.dart';

class CheckPageWidget extends StatefulWidget {
  const CheckPageWidget({Key? key}) : super(key: key);

  @override
  _CheckPageWidgetState createState() => _CheckPageWidgetState();
}

class _CheckPageWidgetState extends State<CheckPageWidget> {
  late CheckPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckPageModel());

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
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Page Title',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: FlutterFlowTheme.of(context).title3Family,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title3Family),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 5,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (currentUserDocument!.coachRef != null)
                      AuthUserStreamWidget(
                        builder: (context) => Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (currentUserDocument!.coachRef != null)
                              Expanded(
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      currentUserDocument!.coachRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    final coachCardUsersRecord = snapshot.data!;
                                    return wrapWithModel(
                                      model: _model.coachCardModel,
                                      updateCallback: () => setState(() {}),
                                      child: CoachCardWidget(
                                        coachName: valueOrDefault<String>(
                                          coachCardUsersRecord.displayName,
                                          'Имя не указано',
                                        ),
                                        coachPhoto: valueOrDefault<String>(
                                          coachCardUsersRecord.photoUrl,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                        ),
                                        delCoachAction: () async {
                                          final usersUpdateData = {
                                            'coach_ref': FieldValue.delete(),
                                          };
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (currentUserDocument!.coachRef == null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.addMenuComponentModel1,
                            updateCallback: () => setState(() {}),
                            child: AddMenuComponentWidget(
                              title: 'Подключить тренера',
                              icon: Icon(
                                Icons.qr_code_scanner,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                              action: () async {
                                _model.trainerStringID =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  'Cancel', // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.QR,
                                );

                                if (_model.trainerStringID != null &&
                                    _model.trainerStringID != '') {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: AddCoachBottomSheetWidget(
                                          coachStringID: _model.trainerStringID,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Упс...'),
                                        content: Text(
                                            'Наведите сканер на QR код тренера'),
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

                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: AuthUserStreamWidget(
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
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: EditContactDataWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: wrapWithModel(
                        model: _model.addMenuComponentModel2,
                        updateCallback: () => setState(() {}),
                        child: AddMenuComponentWidget(
                          title: 'Отслеживание',
                          icon: Icon(
                            FFIcons.kaddressBook,
                          ),
                          action: () async {
                            context.pushNamed(
                              'SelectTracking',
                              queryParams: {
                                'user': serializeParam(
                                  currentUserReference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: wrapWithModel(
                        model: _model.addMenuComponentModel3,
                        updateCallback: () => setState(() {}),
                        child: AddMenuComponentWidget(
                          title: 'Обратная связь',
                          icon: FaIcon(
                            FontAwesomeIcons.questionCircle,
                          ),
                          action: () async {
                            await launchURL('https://t.me/icoachfitness_bot');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
