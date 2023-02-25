import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachCardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for UserAvatar component.
  late UserAvatarModel userAvatarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userAvatarModel = createModel(context, () => UserAvatarModel());
  }

  void dispose() {
    userAvatarModel.dispose();
  }

  /// Additional helper methods are added here.

}
