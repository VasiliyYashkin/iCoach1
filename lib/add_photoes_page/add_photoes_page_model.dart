import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/add_photo_container_widget.dart';
import '../components/choose_date_widget.dart';
import '../components/filled_button_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPhotoesPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for ChooseDate component.
  late ChooseDateModel chooseDateModel;
  DateTime? datePicked;
  // Model for AddPhotoContainer component.
  late AddPhotoContainerModel addPhotoContainerModel1;
  // Model for AddPhotoContainer component.
  late AddPhotoContainerModel addPhotoContainerModel2;
  // Model for AddPhotoContainer component.
  late AddPhotoContainerModel addPhotoContainerModel3;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Model for FilledButton component.
  late FilledButtonModel filledButtonModel;
  // Stores action output result for [Backend Call - Create Document] action in FilledButton widget.
  PhotoesRecord? fotoesDocRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chooseDateModel = createModel(context, () => ChooseDateModel());
    addPhotoContainerModel1 =
        createModel(context, () => AddPhotoContainerModel());
    addPhotoContainerModel2 =
        createModel(context, () => AddPhotoContainerModel());
    addPhotoContainerModel3 =
        createModel(context, () => AddPhotoContainerModel());
    filledButtonModel = createModel(context, () => FilledButtonModel());
  }

  void dispose() {
    chooseDateModel.dispose();
    addPhotoContainerModel1.dispose();
    addPhotoContainerModel2.dispose();
    addPhotoContainerModel3.dispose();
    filledButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
