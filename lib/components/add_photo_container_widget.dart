import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'add_photo_container_model.dart';
export 'add_photo_container_model.dart';

class AddPhotoContainerWidget extends StatefulWidget {
  const AddPhotoContainerWidget({
    Key? key,
    this.photoLink,
  }) : super(key: key);

  final String? photoLink;

  @override
  _AddPhotoContainerWidgetState createState() =>
      _AddPhotoContainerWidgetState();
}

class _AddPhotoContainerWidgetState extends State<AddPhotoContainerWidget> {
  late AddPhotoContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPhotoContainerModel());

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
      width: MediaQuery.of(context).size.width * 0.32,
      height: MediaQuery.of(context).size.height * 0.3,
      constraints: BoxConstraints(
        maxWidth: 200,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: FlutterFlowExpandedImageView(
                  image: Image.network(
                    valueOrDefault<String>(
                      widget.photoLink,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                  allowRotation: false,
                  tag: valueOrDefault<String>(
                    widget.photoLink,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                  ),
                  useHeroAnimation: true,
                ),
              ),
            );
          },
          child: Hero(
            tag: valueOrDefault<String>(
              widget.photoLink,
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
            ),
            transitionOnUserGestures: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                valueOrDefault<String>(
                  widget.photoLink,
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/lewvgt4mo9px/ae8ac2fa217d23aadcc913989fcc34a2.png',
                ),
                width: 120,
                height: 213,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
