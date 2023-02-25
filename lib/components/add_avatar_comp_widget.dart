import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_avatar_comp_model.dart';
export 'add_avatar_comp_model.dart';

class AddAvatarCompWidget extends StatefulWidget {
  const AddAvatarCompWidget({
    Key? key,
    this.photoPath,
    this.imgSize,
  }) : super(key: key);

  final String? photoPath;
  final int? imgSize;

  @override
  _AddAvatarCompWidgetState createState() => _AddAvatarCompWidgetState();
}

class _AddAvatarCompWidgetState extends State<AddAvatarCompWidget> {
  late AddAvatarCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAvatarCompModel());

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

    return Stack(
      alignment: AlignmentDirectional(1, 0),
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: wrapWithModel(
            model: _model.userAvatarModel,
            updateCallback: () => setState(() {}),
            child: UserAvatarWidget(
              photoPath: widget.photoPath,
              imgSize: widget.imgSize,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0.65),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.edit_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
