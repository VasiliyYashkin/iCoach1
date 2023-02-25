import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_date_model.dart';
export 'choose_date_model.dart';

class ChooseDateWidget extends StatefulWidget {
  const ChooseDateWidget({
    Key? key,
    this.date,
    this.datePickerAction,
  }) : super(key: key);

  final String? date;
  final Future<dynamic> Function()? datePickerAction;

  @override
  _ChooseDateWidgetState createState() => _ChooseDateWidgetState();
}

class _ChooseDateWidgetState extends State<ChooseDateWidget> {
  late ChooseDateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseDateModel());

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FFButtonWidget(
          onPressed: () async {
            await widget.datePickerAction?.call();
          },
          text: widget.date!,
          options: FFButtonOptions(
            height: 40,
            color: FlutterFlowTheme.of(context).primaryBackground,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).subtitle2Family),
                ),
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).tertiaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
