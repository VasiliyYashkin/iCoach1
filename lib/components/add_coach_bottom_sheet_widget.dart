import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/filled_button_widget.dart';
import '../components/outline_button_widget.dart';
import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_coach_bottom_sheet_model.dart';
export 'add_coach_bottom_sheet_model.dart';

class AddCoachBottomSheetWidget extends StatefulWidget {
  const AddCoachBottomSheetWidget({
    Key? key,
    this.coachStringID,
  }) : super(key: key);

  final String? coachStringID;

  @override
  _AddCoachBottomSheetWidgetState createState() =>
      _AddCoachBottomSheetWidgetState();
}

class _AddCoachBottomSheetWidgetState extends State<AddCoachBottomSheetWidget> {
  late AddCoachBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCoachBottomSheetModel());

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

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(functions
                      .stringUserIDToUserDocRef(widget.coachStringID!)),
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
                    final columnUsersRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 3,
                            indent: 150,
                            endIndent: 150,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 16, 0),
                                  child: Text(
                                    columnUsersRecord.displayName!,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .title2Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .title2Family),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'Нажав на кнопку \"Добавить\" вы назначите этого человека своим тренером',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.userAvatarModel,
                                    updateCallback: () => setState(() {}),
                                    child: UserAvatarWidget(
                                      photoPath: columnUsersRecord.photoUrl,
                                      imgSize: 100,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                wrapWithModel(
                                  model: _model.outlineButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: OutlineButtonWidget(
                                    buttonTitle: 'Отмена',
                                    buttonAction: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filledButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: FilledButtonWidget(
                                    buttonTitle: 'Добавить',
                                    buttonAction: () async {
                                      final usersUpdateData =
                                          createUsersRecordData(
                                        coachRef: columnUsersRecord.reference,
                                      );
                                      await currentUserReference!
                                          .update(usersUpdateData);
                                      Navigator.pop(context);
                                      triggerPushNotification(
                                        notificationTitle: 'Новый клиент',
                                        notificationText:
                                            '${currentUserDisplayName} добавил вас как тренера.',
                                        notificationImageUrl:
                                            columnUsersRecord.photoUrl,
                                        userRefs: [columnUsersRecord.reference],
                                        initialPageName: 'ClientProfile',
                                        parameterData: {},
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
