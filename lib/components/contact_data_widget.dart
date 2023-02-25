import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contact_data_model.dart';
export 'contact_data_model.dart';

class ContactDataWidget extends StatefulWidget {
  const ContactDataWidget({
    Key? key,
    this.email,
    this.phoneNumber,
    this.editData,
    this.user,
  }) : super(key: key);

  final String? email;
  final String? phoneNumber;
  final Future<dynamic> Function()? editData;
  final DocumentReference? user;

  @override
  _ContactDataWidgetState createState() => _ContactDataWidgetState();
}

class _ContactDataWidgetState extends State<ContactDataWidget> {
  late ContactDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactDataModel());

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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Контактные данные',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 16,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                  if (widget.user == currentUserReference)
                    InkWell(
                      onTap: () async {
                        await widget.editData?.call();
                      },
                      child: Icon(
                        FFIcons.kedit2,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
              child: Text(
                valueOrDefault<String>(
                  widget.email,
                  'Email не указан',
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.phoneNumber,
                'Номер телефона не указан',
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
