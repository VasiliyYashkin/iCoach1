import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'meal_switch_component_model.dart';
export 'meal_switch_component_model.dart';

class MealSwitchComponentWidget extends StatefulWidget {
  const MealSwitchComponentWidget({
    Key? key,
    this.user,
    this.calories,
    this.porteinPercentage,
    this.fatsPercentage,
    this.carbsPercentage,
  }) : super(key: key);

  final UsersRecord? user;
  final int? calories;
  final int? porteinPercentage;
  final int? fatsPercentage;
  final int? carbsPercentage;

  @override
  _MealSwitchComponentWidgetState createState() =>
      _MealSwitchComponentWidgetState();
}

class _MealSwitchComponentWidgetState extends State<MealSwitchComponentWidget> {
  late MealSwitchComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealSwitchComponentModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.calories?.toString(),
      '0',
    ));
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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 16, 0),
                        child: AutoSizeText(
                          'Отслеживание питания',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily:
                                    FlutterFlowTheme.of(context).title2Family,
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context).title2Family),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SwitchListTile(
                      value: _model.switchListTileValue ??=
                          widget.user!.mealTracking.mealTrackingOn!,
                      onChanged: (newValue) async {
                        setState(() => _model.switchListTileValue = newValue!);
                        if (newValue!) {
                          setState(() {
                            _model.trackingOn = true;
                          });
                        } else {
                          setState(() {
                            _model.trackingOn = false;
                          });
                        }
                      },
                      title: Text(
                        'Включить',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      activeColor: FlutterFlowTheme.of(context).secondaryColor,
                      activeTrackColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    if (widget.user!.mealTracking.mealTrackingOn != true)
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: Lottie.asset(
                            'assets/lottie_animations/4762-food-carousel.json',
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ),
                      ),
                  ],
                ),
                if (_model.trackingOn ?? true)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    setState(() {
                                      _model.calories = int.tryParse(
                                          _model.textController.text);
                                    });
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Введите количество ккал',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: _model
                                          .textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.textController?.clear();
                                            setState(() {
                                              _model.calories = int.tryParse(
                                                  _model.textController.text);
                                            });
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Text(
                            'ккал',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              '% Белков',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              '% Жиров',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              '% Углеводов',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '100',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Expanded(
                                  child: Text(
                                    'Количество % должно равняться 100',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 12,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Сохранение возможно',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: Color(0xFF53BB44),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            wrapWithModel(
                              model: _model.filledButtonModel,
                              updateCallback: () => setState(() {}),
                              child: FilledButtonWidget(
                                buttonTitle: 'Сохранить',
                                buttonAction: () async {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
