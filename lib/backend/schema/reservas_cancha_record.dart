import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservasCanchaRecord extends FirestoreRecord {
  ReservasCanchaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario_id" field.
  String? _usuarioId;
  String get usuarioId => _usuarioId ?? '';
  bool hasUsuarioId() => _usuarioId != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "hora" field.
  String? _hora;
  String get hora => _hora ?? '';
  bool hasHora() => _hora != null;

  // "cancha" field.
  String? _cancha;
  String get cancha => _cancha ?? '';
  bool hasCancha() => _cancha != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "balonFutbol" field.
  bool? _balonFutbol;
  bool get balonFutbol => _balonFutbol ?? false;
  bool hasBalonFutbol() => _balonFutbol != null;

  // "balonBasket" field.
  bool? _balonBasket;
  bool get balonBasket => _balonBasket ?? false;
  bool hasBalonBasket() => _balonBasket != null;

  void _initializeFields() {
    _usuarioId = snapshotData['usuario_id'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _hora = snapshotData['hora'] as String?;
    _cancha = snapshotData['cancha'] as String?;
    _estado = snapshotData['estado'] as String?;
    _balonFutbol = snapshotData['balonFutbol'] as bool?;
    _balonBasket = snapshotData['balonBasket'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservas_cancha');

  static Stream<ReservasCanchaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservasCanchaRecord.fromSnapshot(s));

  static Future<ReservasCanchaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservasCanchaRecord.fromSnapshot(s));

  static ReservasCanchaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservasCanchaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservasCanchaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservasCanchaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservasCanchaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservasCanchaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservasCanchaRecordData({
  String? usuarioId,
  DateTime? fecha,
  String? hora,
  String? cancha,
  String? estado,
  bool? balonFutbol,
  bool? balonBasket,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario_id': usuarioId,
      'fecha': fecha,
      'hora': hora,
      'cancha': cancha,
      'estado': estado,
      'balonFutbol': balonFutbol,
      'balonBasket': balonBasket,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservasCanchaRecordDocumentEquality
    implements Equality<ReservasCanchaRecord> {
  const ReservasCanchaRecordDocumentEquality();

  @override
  bool equals(ReservasCanchaRecord? e1, ReservasCanchaRecord? e2) {
    return e1?.usuarioId == e2?.usuarioId &&
        e1?.fecha == e2?.fecha &&
        e1?.hora == e2?.hora &&
        e1?.cancha == e2?.cancha &&
        e1?.estado == e2?.estado &&
        e1?.balonFutbol == e2?.balonFutbol &&
        e1?.balonBasket == e2?.balonBasket;
  }

  @override
  int hash(ReservasCanchaRecord? e) => const ListEquality().hash([
        e?.usuarioId,
        e?.fecha,
        e?.hora,
        e?.cancha,
        e?.estado,
        e?.balonFutbol,
        e?.balonBasket
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservasCanchaRecord;
}
