import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/filled_button_widget.dart';
import '../components/outline_button_widget.dart';
import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_avatar_bottomsheet_model.dart';
export 'add_avatar_bottomsheet_model.dart';

class AddAvatarBottomsheetWidget extends StatefulWidget {
  const AddAvatarBottomsheetWidget({Key? key}) : super(key: key);

  @override
  _AddAvatarBottomsheetWidgetState createState() =>
      _AddAvatarBottomsheetWidgetState();
}

class _AddAvatarBottomsheetWidgetState
    extends State<AddAvatarBottomsheetWidget> {
  late AddAvatarBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAvatarBottomsheetModel());

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
      child: Container(
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 8, 16, 20),
                                child: Text(
                                  'Изменить фото',
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AuthUserStreamWidget(
                                  builder: (context) => wrapWithModel(
                                    model: _model.userAvatarModel,
                                    updateCallback: () => setState(() {}),
                                    child: UserAvatarWidget(
                                      photoPath:
                                          _model.uploadedFileUrl != null &&
                                                  _model.uploadedFileUrl != ''
                                              ? _model.uploadedFileUrl
                                              : valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                ),
                                      imgSize: 100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              wrapWithModel(
                                model: _model.outlineButtonModel,
                                updateCallback: () => setState(() {}),
                                child: OutlineButtonWidget(
                                  buttonTitle: 'Загрузить',
                                  buttonAction: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isMediaUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Файл загружается...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isMediaUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Успех!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Файл не загружен...');
                                        return;
                                      }
                                    }
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  Navigator.pop(context);
                                },
                                child: wrapWithModel(
                                  model: _model.filledButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: FilledButtonWidget(
                                    buttonTitle: 'Сохранить',
                                    buttonAction: () async {
                                      if (_model.uploadedFileUrl != null &&
                                          _model.uploadedFileUrl != '') {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          photoUrl: _model.uploadedFileUrl,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        Navigator.pop(context);
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Упс'),
                                              content: Text(
                                                  'Вы не загрузили фотографию'),
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
                                      }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
