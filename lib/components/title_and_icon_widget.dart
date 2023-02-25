import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'title_and_icon_model.dart';
export 'title_and_icon_model.dart';

class TitleAndIconWidget extends StatefulWidget {
  const TitleAndIconWidget({
    Key? key,
    this.title,
    this.icon,
    this.action,
  }) : super(key: key);

  final String? title;
  final Widget? icon;
  final Future<dynamic> Function()? action;

  @override
  _TitleAndIconWidgetState createState() => _TitleAndIconWidgetState();
}

class _TitleAndIconWidgetState extends State<TitleAndIconWidget> {
  late TitleAndIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TitleAndIconModel());

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        InkWell(
          onTap: () async {
            await widget.action?.call();
          },
          child: widget.icon!,
        ),
      ],
    );
  }
}
