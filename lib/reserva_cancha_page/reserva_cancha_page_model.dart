import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reserva_cancha_page_widget.dart' show ReservaCanchaPageWidget;
import 'package:flutter/material.dart';

class ReservaCanchaPageModel extends FlutterFlowModel<ReservaCanchaPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for Hora widget.
  String? horaValue;
  FormFieldController<String>? horaValueController;
  // State field(s) for Cancha widget.
  String? canchaValue;
  FormFieldController<String>? canchaValueController;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
