import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/coacht_nav_bar_widget.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ClientsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  final searchFieldKey = GlobalKey();
  TextEditingController? searchFieldController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Model for CoachtNavBar component.
  late CoachtNavBarModel coachtNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    coachtNavBarModel = createModel(context, () => CoachtNavBarModel());
  }

  void dispose() {
    coachtNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
