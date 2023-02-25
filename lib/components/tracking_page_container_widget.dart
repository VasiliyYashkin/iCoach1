import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tracking_page_container_model.dart';
export 'tracking_page_container_model.dart';

class TrackingPageContainerWidget extends StatefulWidget {
  const TrackingPageContainerWidget({
    Key? key,
    this.title,
    this.navigation,
  }) : super(key: key);

  final String? title;
  final Future<dynamic> Function()? navigation;

  @override
  _TrackingPageContainerWidgetState createState() =>
      _TrackingPageContainerWidgetState();
}

class _TrackingPageContainerWidgetState
    extends State<TrackingPageContainerWidget> {
  late TrackingPageContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingPageContainerModel());

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
        await widget.navigation?.call();
      },
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title!,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 18,
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
    );
  }
}
