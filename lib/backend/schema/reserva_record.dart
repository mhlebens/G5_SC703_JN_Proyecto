import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservaRecord extends FirestoreRecord {
  ReservaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cancha_id" field.
  DocumentReference? _canchaId;
  DocumentReference? get canchaId => _canchaId;
  bool hasCanchaId() => _canchaId != null;

  // "cliente_id" field.
  DocumentReference? _clienteId;
  DocumentReference? get clienteId => _clienteId;
  bool hasClienteId() => _clienteId != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "horaInicio" field.
  String? _horaInicio;
  String get horaInicio => _horaInicio ?? '';
  bool hasHoraInicio() => _horaInicio != null;

  // "horaFin" field.
  String? _horaFin;
  String get horaFin => _horaFin ?? '';
  bool hasHoraFin() => _horaFin != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _canchaId = snapshotData['cancha_id'] as DocumentReference?;
    _clienteId = snapshotData['cliente_id'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _horaInicio = snapshotData['horaInicio'] as String?;
    _horaFin = snapshotData['horaFin'] as String?;
    _estado = snapshotData['estado'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reserva');

  static Stream<ReservaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservaRecord.fromSnapshot(s));

  static Future<ReservaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservaRecord.fromSnapshot(s));

  static ReservaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservaRecordData({
  DocumentReference? canchaId,
  DocumentReference? clienteId,
  DateTime? fecha,
  String? horaInicio,
  String? horaFin,
  String? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cancha_id': canchaId,
      'cliente_id': clienteId,
      'fecha': fecha,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservaRecordDocumentEquality implements Equality<ReservaRecord> {
  const ReservaRecordDocumentEquality();

  @override
  bool equals(ReservaRecord? e1, ReservaRecord? e2) {
    return e1?.canchaId == e2?.canchaId &&
        e1?.clienteId == e2?.clienteId &&
        e1?.fecha == e2?.fecha &&
        e1?.horaInicio == e2?.horaInicio &&
        e1?.horaFin == e2?.horaFin &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ReservaRecord? e) => const ListEquality().hash([
        e?.canchaId,
        e?.clienteId,
        e?.fecha,
        e?.horaInicio,
        e?.horaFin,
        e?.estado
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservaRecord;
}
