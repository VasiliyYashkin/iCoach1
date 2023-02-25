import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'measurements_switch_toggle_model.dart';
export 'measurements_switch_toggle_model.dart';

class MeasurementsSwitchToggleWidget extends StatefulWidget {
  const MeasurementsSwitchToggleWidget({
    Key? key,
    this.name,
    this.user,
  }) : super(key: key);

  final String? name;
  final UsersRecord? user;

  @override
  _MeasurementsSwitchToggleWidgetState createState() =>
      _MeasurementsSwitchToggleWidgetState();
}

class _MeasurementsSwitchToggleWidgetState
    extends State<MeasurementsSwitchToggleWidget> {
  late MeasurementsSwitchToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementsSwitchToggleModel());

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

    return SwitchListTile(
      value: _model.switchListTileValue ??=
          widget.user!.measurmentsSwitch!.toList().contains(widget.name),
      onChanged: (newValue) async {
        setState(() => _model.switchListTileValue = newValue!);
        if (newValue!) {
          final usersUpdateData = {
            'measurmentsSwitch': FieldValue.arrayUnion([widget.name]),
          };
          await widget.user!.reference.update(usersUpdateData);
        } else {
          final usersUpdateData = {
            'measurmentsSwitch': FieldValue.arrayRemove([widget.name]),
          };
          await widget.user!.reference.update(usersUpdateData);
        }
      },
      title: Text(
        widget.name!,
        style: FlutterFlowTheme.of(context).title3,
      ),
      tileColor: FlutterFlowTheme.of(context).primaryBackground,
      activeColor: FlutterFlowTheme.of(context).secondaryColor,
      activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
      dense: false,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
