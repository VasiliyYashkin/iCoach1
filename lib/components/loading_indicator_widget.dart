import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_indicator_model.dart';
export 'loading_indicator_model.dart';

class LoadingIndicatorWidget extends StatefulWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  _LoadingIndicatorWidgetState createState() => _LoadingIndicatorWidgetState();
}

class _LoadingIndicatorWidgetState extends State<LoadingIndicatorWidget> {
  late LoadingIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingIndicatorModel());

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
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Lottie.asset(
          'assets/lottie_animations/105652-fitness-app.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          animate: true,
        ),
      ),
    );
  }
}
