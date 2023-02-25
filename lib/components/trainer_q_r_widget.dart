import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trainer_q_r_model.dart';
export 'trainer_q_r_model.dart';

class TrainerQRWidget extends StatefulWidget {
  const TrainerQRWidget({Key? key}) : super(key: key);

  @override
  _TrainerQRWidgetState createState() => _TrainerQRWidgetState();
}

class _TrainerQRWidgetState extends State<TrainerQRWidget> {
  late TrainerQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainerQRModel());

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
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(
            width: double.infinity,
            height: 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: BarcodeWidget(
                        data: currentUserUid,
                        barcode: Barcode.qrCode(),
                        width: 100,
                        height: 200,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (_context, _error) => SizedBox(
                          width: 100,
                          height: 200,
                        ),
                        drawText: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Дайте клиенту отсканировать QR код',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 70),
                      child: Text(
                        'ВНИМАНИЕ! Клиент может сканировать код только из своего профиля нажав на кнопку \"Добавить тренера\"',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 16,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
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
