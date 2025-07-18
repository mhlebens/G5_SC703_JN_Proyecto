import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImplementosRecord extends FirestoreRecord {
  ImplementosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "disponible" field.
  bool? _disponible;
  bool get disponible => _disponible ?? false;
  bool hasDisponible() => _disponible != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _disponible = snapshotData['disponible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('implementos');

  static Stream<ImplementosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImplementosRecord.fromSnapshot(s));

  static Future<ImplementosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImplementosRecord.fromSnapshot(s));

  static ImplementosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImplementosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImplementosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImplementosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImplementosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImplementosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImplementosRecordData({
  String? nombre,
  bool? disponible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'disponible': disponible,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImplementosRecordDocumentEquality implements Equality<ImplementosRecord> {
  const ImplementosRecordDocumentEquality();

  @override
  bool equals(ImplementosRecord? e1, ImplementosRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.disponible == e2?.disponible;
  }

  @override
  int hash(ImplementosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.disponible]);

  @override
  bool isValidKey(Object? o) => o is ImplementosRecord;
}
