import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CanchasRecord extends FirestoreRecord {
  CanchasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _activa = snapshotData['activa'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Canchas');

  static Stream<CanchasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CanchasRecord.fromSnapshot(s));

  static Future<CanchasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CanchasRecord.fromSnapshot(s));

  static CanchasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CanchasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CanchasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CanchasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CanchasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CanchasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCanchasRecordData({
  String? nombre,
  String? tipo,
  bool? activa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'tipo': tipo,
      'activa': activa,
    }.withoutNulls,
  );

  return firestoreData;
}

class CanchasRecordDocumentEquality implements Equality<CanchasRecord> {
  const CanchasRecordDocumentEquality();

  @override
  bool equals(CanchasRecord? e1, CanchasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.tipo == e2?.tipo &&
        e1?.activa == e2?.activa;
  }

  @override
  int hash(CanchasRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.tipo, e?.activa]);

  @override
  bool isValidKey(Object? o) => o is CanchasRecord;
}
