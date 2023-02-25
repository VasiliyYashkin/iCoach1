import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_logo_model.dart';
export 'app_logo_model.dart';

class AppLogoWidget extends StatefulWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  _AppLogoWidgetState createState() => _AppLogoWidgetState();
}

class _AppLogoWidgetState extends State<AppLogoWidget> {
  late AppLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppLogoModel());

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

    return Image.asset(
      'assets/images/iCoach_(4).png',
      width: 250,
      height: 250,
      fit: BoxFit.contain,
    );
  }
}
