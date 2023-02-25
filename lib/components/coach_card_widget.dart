import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coach_card_model.dart';
export 'coach_card_model.dart';

class CoachCardWidget extends StatefulWidget {
  const CoachCardWidget({
    Key? key,
    this.coachName,
    this.coachPhoto,
    this.delCoachAction,
  }) : super(key: key);

  final String? coachName;
  final String? coachPhoto;
  final Future<dynamic> Function()? delCoachAction;

  @override
  _CoachCardWidgetState createState() => _CoachCardWidgetState();
}

class _CoachCardWidgetState extends State<CoachCardWidget> {
  late CoachCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachCardModel());

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
            color: Color(0x34090F13),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Тренер',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
                InkWell(
                  onTap: () async {
                    await widget.delCoachAction?.call();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    widget.coachName!,
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: wrapWithModel(
                    model: _model.userAvatarModel,
                    updateCallback: () => setState(() {}),
                    child: UserAvatarWidget(
                      photoPath: widget.coachPhoto,
                      imgSize: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
