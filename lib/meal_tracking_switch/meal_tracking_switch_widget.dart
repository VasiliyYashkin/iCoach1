import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'meal_tracking_switch_model.dart';
export 'meal_tracking_switch_model.dart';

class MealTrackingSwitchWidget extends StatefulWidget {
  const MealTrackingSwitchWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UsersRecord? user;

  @override
  _MealTrackingSwitchWidgetState createState() =>
      _MealTrackingSwitchWidgetState();
}

class _MealTrackingSwitchWidgetState extends State<MealTrackingSwitchWidget> {
  late MealTrackingSwitchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealTrackingSwitchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.trackingIsOn = widget.user!.mealTracking.mealTrackingOn != null
            ? widget.user!.mealTracking.mealTrackingOn
            : false;
        _model.calories = widget.user!.mealTracking.calories;
        _model.proteins = widget.user!.mealTracking.protPercentage;
        _model.fats = widget.user!.mealTracking.fatsPercentage;
        _model.carbs = widget.user!.mealTracking.carbsPercentage;
      });
    });

    _model.kkalFullController ??=
        TextEditingController(text: _model.calories?.toString());
    _model.kkalEmptyController ??= TextEditingController();
    _model.protFullController ??=
        TextEditingController(text: _model.proteins?.toString());
    _model.protEmptyController ??= TextEditingController();
    _model.fatFullController ??=
        TextEditingController(text: _model.fats?.toString());
    _model.fatEmptyController ??= TextEditingController();
    _model.carbFullController ??=
        TextEditingController(text: _model.carbs?.toString());
    _model.carbEmptyController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Питание',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: FlutterFlowTheme.of(context).title3Family,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title3Family),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 5,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => SwitchListTile(
                          value: _model.switchListTileValue ??=
                              currentUserDocument!.mealTracking.mealTrackingOn!,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue = newValue!);
                            if (newValue!) {
                              setState(() {
                                _model.trackingIsOn = true;
                              });

                              final usersUpdateData = createUsersRecordData(
                                mealTracking: createMealPlanStruct(
                                  mealTrackingOn: true,
                                  clearUnsetFields: false,
                                ),
                              );
                              await widget.user!.reference
                                  .update(usersUpdateData);
                            } else {
                              setState(() {
                                _model.trackingIsOn = false;
                              });

                              final usersUpdateData = createUsersRecordData(
                                mealTracking: createMealPlanStruct(
                                  mealTrackingOn: false,
                                  clearUnsetFields: false,
                                ),
                              );
                              await widget.user!.reference
                                  .update(usersUpdateData);
                            }
                          },
                          title: Text(
                            'Включить',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      if (!_model.trackingIsOn!)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
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
                  if (_model.trackingIsOn ?? true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_model.calories != null)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _model.kkalFullController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.kkalFullController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.calories = int.tryParse(
                                              _model.kkalFullController.text);
                                        });
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Введите количество ккал',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
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
                                      suffixIcon: _model.kkalFullController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.kkalFullController
                                                    ?.clear();
                                                setState(() {
                                                  _model.calories =
                                                      int.tryParse(_model
                                                          .kkalFullController
                                                          .text);
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .kkalFullControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              if (_model.calories == null)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(),
                                  child: TextFormField(
                                    controller: _model.kkalEmptyController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.kkalEmptyController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.calories = int.tryParse(
                                              _model.kkalEmptyController.text);
                                        });
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Введите количество ккал',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
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
                                      suffixIcon: _model.kkalEmptyController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.kkalEmptyController
                                                    ?.clear();
                                                setState(() {
                                                  _model.calories =
                                                      int.tryParse(_model
                                                          .kkalEmptyController
                                                          .text);
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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .kkalEmptyControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              Text(
                                'ккал',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  '%Белков',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_model.proteins != null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.protFullController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.protFullController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.proteins = int.tryParse(
                                                  _model
                                                      .protFullController.text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .protFullControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.protFullMask],
                                      ),
                                    ),
                                  if (_model.proteins == null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.protEmptyController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.protEmptyController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.proteins = int.tryParse(
                                                  _model.protEmptyController
                                                      .text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .protEmptyControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.protEmptyMask],
                                      ),
                                    ),
                                  if ((_model.calories != null) &&
                                      (_model.proteins != null))
                                    Text(
                                      '${formatNumber(
                                        functions
                                            .protAndCarbAccordingToCalPercentage(
                                                _model.calories!,
                                                _model.proteins!),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )}г',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  '%Жиров',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_model.fats != null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.fatFullController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.fatFullController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.fats = int.tryParse(_model
                                                  .fatFullController.text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .fatFullControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.fatFullMask],
                                      ),
                                    ),
                                  if (_model.fats == null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.fatEmptyController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.fatEmptyController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.fats = int.tryParse(_model
                                                  .fatEmptyController.text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .fatEmptyControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.fatEmptyMask],
                                      ),
                                    ),
                                  if ((_model.calories != null) &&
                                      (_model.fats != null))
                                    Text(
                                      '${formatNumber(
                                        functions.fatsAccordingToCalPercentage(
                                            _model.calories!, _model.fats!),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )}г',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  '%Углеводов',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_model.carbs != null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.carbFullController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.carbFullController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.carbs = int.tryParse(_model
                                                  .carbFullController.text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .carbFullControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.carbFullMask],
                                      ),
                                    ),
                                  if (_model.carbs == null)
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model.carbEmptyController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.carbEmptyController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            setState(() {
                                              _model.carbs = int.tryParse(_model
                                                  .carbEmptyController.text);
                                            });
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDD1C1A),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .carbEmptyControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.carbEmptyMask],
                                      ),
                                    ),
                                  if ((_model.calories != null) &&
                                      (_model.carbs != null))
                                    Text(
                                      '${formatNumber(
                                        functions
                                            .protAndCarbAccordingToCalPercentage(
                                                _model.calories!,
                                                _model.carbs!),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )}г',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Всего - ${functions.summIs100(_model.proteins!, _model.fats!, _model.carbs!).toString()}%',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              if (functions
                                      .summIs100(_model.proteins!, _model.fats!,
                                          _model.carbs!)
                                      .toString() !=
                                  '100')
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
                              if (functions
                                      .summIs100(_model.proteins!, _model.fats!,
                                          _model.carbs!)
                                      .toString() ==
                                  '100')
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
                        if (functions
                                .summIs100(_model.proteins!, _model.fats!,
                                    _model.carbs!)
                                .toString() ==
                            '100')
                          wrapWithModel(
                            model: _model.filledButtonModel,
                            updateCallback: () => setState(() {}),
                            child: FilledButtonWidget(
                              buttonTitle: 'Сохранить',
                              buttonAction: () async {
                                final usersUpdateData = createUsersRecordData(
                                  mealTracking: createMealPlanStruct(
                                    porteins: functions
                                        .protAndCarbAccordingToCalPercentage(
                                            _model.calories!, _model.proteins!),
                                    fats:
                                        functions.fatsAccordingToCalPercentage(
                                            _model.calories!, _model.fats!),
                                    carbs: functions
                                        .protAndCarbAccordingToCalPercentage(
                                            _model.calories!, _model.carbs!),
                                    calories: _model.calories,
                                    protPercentage: _model.proteins,
                                    fatsPercentage: _model.fats,
                                    carbsPercentage: _model.carbs,
                                    clearUnsetFields: false,
                                  ),
                                );
                                await widget.user!.reference
                                    .update(usersUpdateData);
                                context.pop();
                              },
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
