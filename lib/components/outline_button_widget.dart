import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'outline_button_model.dart';
export 'outline_button_model.dart';

class OutlineButtonWidget extends StatefulWidget {
  const OutlineButtonWidget({
    Key? key,
    this.buttonTitle,
    this.buttonAction,
  }) : super(key: key);

  final String? buttonTitle;
  final Future<dynamic> Function()? buttonAction;

  @override
  _OutlineButtonWidgetState createState() => _OutlineButtonWidgetState();
}

class _OutlineButtonWidgetState extends State<OutlineButtonWidget> {
  late OutlineButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OutlineButtonModel());

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

    return FFButtonWidget(
      onPressed: () async {
        await widget.buttonAction?.call();
      },
      text: widget.buttonTitle!,
      options: FFButtonOptions(
        width: 150,
        height: 56,
        color: Colors.white,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
              color: FlutterFlowTheme.of(context).secondaryColor,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).subtitle2Family),
            ),
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).secondaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
