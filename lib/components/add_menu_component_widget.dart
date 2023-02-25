import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_menu_component_model.dart';
export 'add_menu_component_model.dart';

class AddMenuComponentWidget extends StatefulWidget {
  const AddMenuComponentWidget({
    Key? key,
    this.title,
    this.action,
    this.icon,
  }) : super(key: key);

  final String? title;
  final Future<dynamic> Function()? action;
  final Widget? icon;

  @override
  _AddMenuComponentWidgetState createState() => _AddMenuComponentWidgetState();
}

class _AddMenuComponentWidgetState extends State<AddMenuComponentWidget> {
  late AddMenuComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMenuComponentModel());

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

    return InkWell(
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icon!,
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text(
                  widget.title!,
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText2Family,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText2Family),
                      ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    size: 18,
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
