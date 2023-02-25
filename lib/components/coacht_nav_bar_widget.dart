import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coacht_nav_bar_model.dart';
export 'coacht_nav_bar_model.dart';

class CoachtNavBarWidget extends StatefulWidget {
  const CoachtNavBarWidget({
    Key? key,
    this.page,
  }) : super(key: key);

  final String? page;

  @override
  _CoachtNavBarWidgetState createState() => _CoachtNavBarWidgetState();
}

class _CoachtNavBarWidgetState extends State<CoachtNavBarWidget>
    with TickerProviderStateMixin {
  late CoachtNavBarModel _model;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-5, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 5),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(5, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachtNavBarModel());

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
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        alignment: AlignmentDirectional(0, -1),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  if (widget.page == 'CoachDashboard') {
                    return;
                  }

                  context.goNamed(
                    'Dashboard',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Icon(
                  FFIcons.klayoutFluid,
                  color: valueOrDefault<Color>(
                    widget.page == 'CoachDashboard'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
              InkWell(
                onTap: () async {
                  if (widget.page == 'CoachClients') {
                    return;
                  }

                  context.goNamed(
                    'Clients',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Icon(
                  FFIcons.kusers,
                  color: valueOrDefault<Color>(
                    widget.page == 'CoachClients'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
              InkWell(
                onTap: () async {
                  if (widget.page == 'CoachProfile') {
                    return;
                  }

                  context.goNamed(
                    'CoachProfile',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Icon(
                  FFIcons.kuser,
                  color: valueOrDefault<Color>(
                    widget.page == 'CoachProfile'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
            ],
          ),
        ),
      ),
    );
  }
}
