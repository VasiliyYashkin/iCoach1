import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_notification_model.dart';
export 'control_notification_model.dart';

class ControlNotificationWidget extends StatefulWidget {
  const ControlNotificationWidget({
    Key? key,
    this.icon,
    this.title,
    this.onTapAction,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final Future<dynamic> Function()? onTapAction;

  @override
  _ControlNotificationWidgetState createState() =>
      _ControlNotificationWidgetState();
}

class _ControlNotificationWidgetState extends State<ControlNotificationWidget> {
  late ControlNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlNotificationModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      child: InkWell(
        onTap: () async {
          await widget.onTapAction?.call();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.icon!,
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                  child: Text(
                    widget.title!,
                    style: FlutterFlowTheme.of(context).bodyText1,
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
