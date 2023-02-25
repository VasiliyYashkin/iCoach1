import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_avatar_model.dart';
export 'user_avatar_model.dart';

class UserAvatarWidget extends StatefulWidget {
  const UserAvatarWidget({
    Key? key,
    this.photoPath,
    this.imgSize,
  }) : super(key: key);

  final String? photoPath;
  final int? imgSize;

  @override
  _UserAvatarWidgetState createState() => _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends State<UserAvatarWidget> {
  late UserAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAvatarModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: widget.imgSize?.toDouble(),
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).tertiaryColor,
                  FlutterFlowTheme.of(context).secondaryColor
                ],
                stops: [0, 1],
                begin: AlignmentDirectional(0.17, -1),
                end: AlignmentDirectional(-0.17, 1),
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl: valueOrDefault<String>(
                    widget.photoPath,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
