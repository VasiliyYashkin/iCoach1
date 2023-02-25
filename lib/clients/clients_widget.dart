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
import 'clients_model.dart';
export 'clients_model.dart';

class ClientsWidget extends StatefulWidget {
  const ClientsWidget({Key? key}) : super(key: key);

  @override
  _ClientsWidgetState createState() => _ClientsWidgetState();
}

class _ClientsWidgetState extends State<ClientsWidget> {
  late ClientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().SearchIsActive = false;
      });
    });

    _model.searchFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                'Клиенты',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      color: Colors.white,
                      fontSize: 22,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) => usersRecord
                      .where('coach_ref', isEqualTo: currentUserReference)
                      .orderBy('display_name'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitCircle(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxWidth: 600,
                    ),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 0, 0),
                                        child: Autocomplete<String>(
                                          initialValue: TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return containerUsersRecordList
                                                .map((e) => e.displayName)
                                                .withoutNulls
                                                .toList()
                                                .toList()
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.searchFieldKey,
                                              textController:
                                                  _model.searchFieldController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              textHighlightStyle: TextStyle(),
                                              elevation: 4,
                                              optionBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              maxHeight: 200,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() => _model
                                                    .searchFieldSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.searchFieldController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.searchFieldKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.searchFieldController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  setState(() {
                                                    _model.simpleSearchResults =
                                                        TextSearch(
                                                      containerUsersRecordList
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem(
                                                                    record, [
                                                              record.email!,
                                                              record
                                                                  .displayName!,
                                                              record
                                                                  .phoneNumber!
                                                            ]),
                                                          )
                                                          .toList(),
                                                    )
                                                            .search(_model
                                                                .searchFieldController
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
                                                            .toList();
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .SearchIsActive = true;
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Введите имя клиента',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                prefixIcon: Icon(
                                                  Icons.search_rounded,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              validator: _model
                                                  .searchFieldControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _model.searchFieldController
                                                ?.clear();
                                          });
                                          FFAppState().update(() {
                                            FFAppState().SearchIsActive = false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!FFAppState().SearchIsActive)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final clientsNoSearch =
                                          containerUsersRecordList.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: clientsNoSearch.length,
                                        itemBuilder:
                                            (context, clientsNoSearchIndex) {
                                          final clientsNoSearchItem =
                                              clientsNoSearch[
                                                  clientsNoSearchIndex];
                                          return Visibility(
                                            visible:
                                                clientsNoSearchItem.coachRef ==
                                                    currentUserReference,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 16),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ClientDetailPage',
                                                    queryParams: {
                                                      'clientID':
                                                          serializeParam(
                                                        clientsNoSearchItem
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            clientsNoSearchItem
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      clientsNoSearchItem
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (FFAppState().SearchIsActive)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 16, 16, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final clientsNoSearch =
                                          _model.simpleSearchResults.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: clientsNoSearch.length,
                                        itemBuilder:
                                            (context, clientsNoSearchIndex) {
                                          final clientsNoSearchItem =
                                              clientsNoSearch[
                                                  clientsNoSearchIndex];
                                          return Visibility(
                                            visible:
                                                clientsNoSearchItem.coachRef ==
                                                    currentUserReference,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 16),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ClientDetailPage',
                                                    queryParams: {
                                                      'clientID':
                                                          serializeParam(
                                                        clientsNoSearchItem
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            clientsNoSearchItem
                                                                .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/i-coach-pk683t/assets/6wp7ufbls5sf/istockphoto-1288129985-612x612.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      clientsNoSearchItem
                                                          .displayName!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            wrapWithModel(
              model: _model.coachtNavBarModel,
              updateCallback: () => setState(() {}),
              child: CoachtNavBarWidget(
                page: 'CoachClients',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
