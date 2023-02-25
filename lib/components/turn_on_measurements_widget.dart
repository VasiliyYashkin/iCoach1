import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'turn_on_measurements_model.dart';
export 'turn_on_measurements_model.dart';

class TurnOnMeasurementsWidget extends StatefulWidget {
  const TurnOnMeasurementsWidget({
    Key? key,
    this.user,
    this.navigate,
  }) : super(key: key);

  final DocumentReference? user;
  final Future<dynamic> Function()? navigate;

  @override
  _TurnOnMeasurementsWidgetState createState() =>
      _TurnOnMeasurementsWidgetState();
}

class _TurnOnMeasurementsWidgetState extends State<TurnOnMeasurementsWidget> {
  late TurnOnMeasurementsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TurnOnMeasurementsModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
            child: Text(
              'Включите нужные параметры замеров в профиле.',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 18,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ),
          wrapWithModel(
            model: _model.filledButtonModel,
            updateCallback: () => setState(() {}),
            child: FilledButtonWidget(
              buttonTitle: 'Включить',
              buttonAction: () async {
                await widget.navigate?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
