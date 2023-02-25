import '../auth/auth_util.dart';
import '../components/add_menu_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_nav_bar_model.dart';
export 'client_nav_bar_model.dart';

class ClientNavBarWidget extends StatefulWidget {
  const ClientNavBarWidget({
    Key? key,
    this.page,
  }) : super(key: key);

  final String? page;

  @override
  _ClientNavBarWidgetState createState() => _ClientNavBarWidgetState();
}

class _ClientNavBarWidgetState extends State<ClientNavBarWidget>
    with TickerProviderStateMixin {
  late ClientNavBarModel _model;

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
          begin: Offset(-10, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 8),
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
          begin: Offset(10, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation4': AnimationInfo(
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
    _model = createModel(context, () => ClientNavBarModel());

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
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  if (widget.page == 'ClientCalendar') {
                    return;
                  }

                  context.goNamed(
                    'ClientHomePage',
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
                  FFIcons.kcalendarCheck,
                  color: valueOrDefault<Color>(
                    widget.page == 'ClientCalendar'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation1']!),
              InkWell(
                onTap: () async {
                  if (widget.page == 'ComparePage') {
                    return;
                  }

                  context.goNamed(
                    'ComparePage',
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
                  FFIcons.kcodeCompare,
                  color: valueOrDefault<Color>(
                    widget.page == 'ComparePage'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 60,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.of(context).secondaryColor,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: AddMenuWidget(
                          user: currentUserReference,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
              ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation']!),
              InkWell(
                onTap: () async {
                  if (widget.page == 'ClientProgress') {
                    return;
                  }

                  context.goNamed(
                    'ClientProgress',
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
                  FFIcons.kchatArrowGrow,
                  color: valueOrDefault<Color>(
                    widget.page == 'ClientProgress'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
              InkWell(
                onTap: () async {
                  if (widget.page == 'ClientProfile') {
                    return;
                  }

                  context.goNamed(
                    'ClientProfile',
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
                    widget.page == 'ClientProfile'
                        ? FlutterFlowTheme.of(context).tertiaryColor
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  size: 24,
                ),
              ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation4']!),
            ],
          ),
        ),
      ),
    );
  }
}
