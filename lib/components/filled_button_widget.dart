import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filled_button_model.dart';
export 'filled_button_model.dart';

class FilledButtonWidget extends StatefulWidget {
  const FilledButtonWidget({
    Key? key,
    this.buttonTitle,
    this.buttonAction,
  }) : super(key: key);

  final String? buttonTitle;
  final Future<dynamic> Function()? buttonAction;

  @override
  _FilledButtonWidgetState createState() => _FilledButtonWidgetState();
}

class _FilledButtonWidgetState extends State<FilledButtonWidget> {
  late FilledButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilledButtonModel());

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
        height: 56,
        color: FlutterFlowTheme.of(context).secondaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).subtitle2Family),
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
