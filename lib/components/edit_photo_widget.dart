import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'edit_photo_model.dart';
export 'edit_photo_model.dart';

class EditPhotoWidget extends StatefulWidget {
  const EditPhotoWidget({
    Key? key,
    this.user,
    this.photoDocument,
  }) : super(key: key);

  final DocumentReference? user;
  final DocumentReference? photoDocument;

  @override
  _EditPhotoWidgetState createState() => _EditPhotoWidgetState();
}

class _EditPhotoWidgetState extends State<EditPhotoWidget> {
  late EditPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPhotoModel());

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
      child: Material(
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
              child: StreamBuilder<PhotoesRecord>(
                stream: PhotoesRecord.getDocument(widget.photoDocument!),
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
                  final columnPhotoesRecord = snapshot.data!;
                  return SingleChildScrollView(
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                          child: Text(
                            'Отредактируйте дату фото',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .title1Family),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Дата',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.chooseDateModel,
                                  updateCallback: () => setState(() {}),
                                  child: ChooseDateWidget(
                                    date: _model.datePicked != null
                                        ? dateTimeFormat(
                                            'd/M/y',
                                            _model.datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : columnPhotoesRecord.dropdownDate,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            columnPhotoesRecord.front,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          columnPhotoesRecord.front,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    columnPhotoesRecord.front,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      columnPhotoesRecord.front,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                    ),
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            columnPhotoesRecord.side,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          columnPhotoesRecord.side,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    columnPhotoesRecord.side,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      columnPhotoesRecord.side,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                    ),
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            columnPhotoesRecord.back,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          columnPhotoesRecord.back,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    columnPhotoesRecord.back,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      columnPhotoesRecord.back,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                                    ),
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    final photoesUpdateData =
                                        createPhotoesRecordData(
                                      date: _model.datePicked,
                                      dropdownDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                    );
                                    await columnPhotoesRecord.reference
                                        .update(photoesUpdateData);
                                  }
                                }
                                Navigator.pop(context);
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
      ),
    );
  }
}
