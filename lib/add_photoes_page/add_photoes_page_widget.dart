import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/add_photo_container_widget.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_photoes_page_model.dart';
export 'add_photoes_page_model.dart';

class AddPhotoesPageWidget extends StatefulWidget {
  const AddPhotoesPageWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _AddPhotoesPageWidgetState createState() => _AddPhotoesPageWidgetState();
}

class _AddPhotoesPageWidgetState extends State<AddPhotoesPageWidget> {
  late AddPhotoesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPhotoesPageModel());

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
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Добавить фото',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2,
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 0),
                      child: wrapWithModel(
                        model: _model.chooseDateModel,
                        updateCallback: () => setState(() {}),
                        child: ChooseDateWidget(
                          date: valueOrDefault<String>(
                            dateTimeFormat(
                              'd/M/y',
                              _model.datePicked,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            'Выберите дату',
                          ),
                          datePickerAction: () async {
                            final _datePickedDate = await showDatePicker(
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Анфас',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    'Профиль',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    'Спина',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            if ((_model.uploadedFileUrl1 != null &&
                                    _model.uploadedFileUrl1 != '') ||
                                (_model.uploadedFileUrl2 != null &&
                                    _model.uploadedFileUrl2 != '') ||
                                (_model.uploadedFileUrl3 != null &&
                                    _model.uploadedFileUrl3 != ''))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.addPhotoContainerModel1,
                                      updateCallback: () => setState(() {}),
                                      child: AddPhotoContainerWidget(
                                        photoLink: valueOrDefault<String>(
                                          _model.uploadedFileUrl1,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.addPhotoContainerModel2,
                                      updateCallback: () => setState(() {}),
                                      child: AddPhotoContainerWidget(
                                        photoLink: valueOrDefault<String>(
                                          _model.uploadedFileUrl2,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.addPhotoContainerModel3,
                                      updateCallback: () => setState(() {}),
                                      child: AddPhotoContainerWidget(
                                        photoLink: valueOrDefault<String>(
                                          _model.uploadedFileUrl3,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 50,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                          _model.isMediaUploading1 = true);
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
                                        _model.isMediaUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl1 =
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
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 50,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                          _model.isMediaUploading2 = true);
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
                                        _model.isMediaUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
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
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 50,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                          _model.isMediaUploading3 = true);
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
                                        _model.isMediaUploading3 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile3 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl3 =
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: StreamBuilder<List<PhotoesRecord>>(
                              stream: queryPhotoesRecord(
                                parent: currentUserReference,
                                queryBuilder: (photoesRecord) =>
                                    photoesRecord.where('dropdown_date',
                                        isEqualTo: dateTimeFormat(
                                          'd/M/y',
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<PhotoesRecord>
                                    filledButtonPhotoesRecordList =
                                    snapshot.data!;
                                final filledButtonPhotoesRecord =
                                    filledButtonPhotoesRecordList.isNotEmpty
                                        ? filledButtonPhotoesRecordList.first
                                        : null;
                                return wrapWithModel(
                                  model: _model.filledButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: FilledButtonWidget(
                                    buttonTitle: 'Сохранить',
                                    buttonAction: () async {
                                      var _shouldSetState = false;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.datePicked == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Выберите дату',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.uploadedFileUrl1 == null ||
                                          _model.uploadedFileUrl1.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Загрузите фото анфас',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.uploadedFileUrl2 == null ||
                                          _model.uploadedFileUrl2.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Загрузите фото в профиль',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.uploadedFileUrl3 == null ||
                                          _model.uploadedFileUrl3.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Загрузите фото со спины',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.datePicked != null) {
                                        if (filledButtonPhotoesRecord != null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Упс'),
                                                content: Text(
                                                    'На текущую дату уже сделан фотоконтроль'),
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
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Нельзя выбирать будущую дату',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            final photoesCreateData =
                                                createPhotoesRecordData(
                                              createdAt: _model.datePicked,
                                              createdBy: currentUserReference,
                                              front: _model.uploadedFileUrl1,
                                              side: _model.uploadedFileUrl2,
                                              back: _model.uploadedFileUrl3,
                                              dropdownDate: dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              date: _model.datePicked,
                                            );
                                            var photoesRecordReference =
                                                PhotoesRecord.createDoc(
                                                    widget.user!);
                                            await photoesRecordReference
                                                .set(photoesCreateData);
                                            _model.fotoesDocRef = PhotoesRecord
                                                .getDocumentFromData(
                                                    photoesCreateData,
                                                    photoesRecordReference);
                                            _shouldSetState = true;
                                            context.pop();
                                            if (currentUserDocument!.coachRef !=
                                                null) {
                                              triggerPushNotification(
                                                notificationTitle: 'Фото',
                                                notificationText:
                                                    '${currentUserDisplayName}доабавл(-ла) новые фото',
                                                notificationImageUrl:
                                                    currentUserPhoto,
                                                notificationSound: 'default',
                                                userRefs: [
                                                  currentUserDocument!.coachRef!
                                                ],
                                                initialPageName: 'Dashboard',
                                                parameterData: {},
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Упс...'),
                                              content: Text('Выберите дату'),
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

                                      if (_shouldSetState) setState(() {});
                                    },
                                  ),
                                );
                              },
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
