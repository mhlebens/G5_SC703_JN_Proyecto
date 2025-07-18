import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'solicitar_implementos_page_widget.dart'
    show SolicitarImplementosPageWidget;
import 'package:flutter/material.dart';

class SolicitarImplementosPageModel
    extends FlutterFlowModel<SolicitarImplementosPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<ImplementosRecord, bool> checkboxValueMap = {};
  List<ImplementosRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
