import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TorneosRecord extends FirestoreRecord {
  TorneosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "disponiblre" field.
  bool? _disponiblre;
  bool get disponiblre => _disponiblre ?? false;
  bool hasDisponiblre() => _disponiblre != null;

  void _initializeFields() {
    _tipo = snapshotData['tipo'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _disponiblre = snapshotData['disponiblre'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('torneos');

  static Stream<TorneosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TorneosRecord.fromSnapshot(s));

  static Future<TorneosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TorneosRecord.fromSnapshot(s));

  static TorneosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TorneosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TorneosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TorneosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TorneosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TorneosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTorneosRecordData({
  String? tipo,
  DateTime? fecha,
  bool? disponiblre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'fecha': fecha,
      'disponiblre': disponiblre,
    }.withoutNulls,
  );

  return firestoreData;
}

class TorneosRecordDocumentEquality implements Equality<TorneosRecord> {
  const TorneosRecordDocumentEquality();

  @override
  bool equals(TorneosRecord? e1, TorneosRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.fecha == e2?.fecha &&
        e1?.disponiblre == e2?.disponiblre;
  }

  @override
  int hash(TorneosRecord? e) =>
      const ListEquality().hash([e?.tipo, e?.fecha, e?.disponiblre]);

  @override
  bool isValidKey(Object? o) => o is TorneosRecord;
}
