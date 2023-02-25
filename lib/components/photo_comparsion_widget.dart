import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_comparsion_model.dart';
export 'photo_comparsion_model.dart';

class PhotoComparsionWidget extends StatefulWidget {
  const PhotoComparsionWidget({
    Key? key,
    this.bodyPosition,
    this.dateBefore,
    this.dateAfter,
    this.user,
  }) : super(key: key);

  final String? bodyPosition;
  final String? dateBefore;
  final String? dateAfter;
  final DocumentReference? user;

  @override
  _PhotoComparsionWidgetState createState() => _PhotoComparsionWidgetState();
}

class _PhotoComparsionWidgetState extends State<PhotoComparsionWidget> {
  late PhotoComparsionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoComparsionModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          constraints: BoxConstraints(
            maxWidth: 300,
            maxHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          decoration: BoxDecoration(),
          child: StreamBuilder<List<PhotoesRecord>>(
            stream: queryPhotoesRecord(
              parent: widget.user,
              queryBuilder: (photoesRecord) => photoesRecord
                  .where('dropdown_date', isEqualTo: widget.dateBefore),
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
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<PhotoesRecord> imagePhotoesRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final imagePhotoesRecord = imagePhotoesRecordList.isNotEmpty
                  ? imagePhotoesRecordList.first
                  : null;
              return Image.network(
                valueOrDefault<String>(
                  () {
                    if (widget.bodyPosition == 'Лицо') {
                      return imagePhotoesRecord!.front;
                    } else if (widget.bodyPosition == 'Профиль') {
                      return imagePhotoesRecord!.side;
                    } else if (widget.bodyPosition == 'Спина') {
                      return imagePhotoesRecord!.back;
                    } else {
                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png';
                    }
                  }(),
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 300,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          constraints: BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(),
          child: StreamBuilder<List<PhotoesRecord>>(
            stream: queryPhotoesRecord(
              parent: widget.user,
              queryBuilder: (photoesRecord) => photoesRecord
                  .where('dropdown_date', isEqualTo: widget.dateAfter),
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
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                );
              }
              List<PhotoesRecord> imagePhotoesRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final imagePhotoesRecord = imagePhotoesRecordList.isNotEmpty
                  ? imagePhotoesRecordList.first
                  : null;
              return Image.network(
                valueOrDefault<String>(
                  () {
                    if (widget.bodyPosition == 'Лицо') {
                      return imagePhotoesRecord!.front;
                    } else if (widget.bodyPosition == 'Профиль') {
                      return imagePhotoesRecord!.side;
                    } else if (widget.bodyPosition == 'Спина') {
                      return imagePhotoesRecord!.back;
                    } else {
                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png';
                    }
                  }(),
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 300,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    );
  }
}
