import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/filled_button_widget.dart';
import '../components/outline_button_widget.dart';
import '../components/user_avatar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAvatarBottomsheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for UserAvatar component.
  late UserAvatarModel userAvatarModel;
  // Model for OutlineButton component.
  late OutlineButtonModel outlineButtonModel;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userAvatarModel = createModel(context, () => UserAvatarModel());
    outlineButtonModel = createModel(context, () => OutlineButtonModel());
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    userAvatarModel.dispose();
    outlineButtonModel.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
