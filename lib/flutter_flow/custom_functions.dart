import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String formatDate(DateTime value) {
  final DateFormat formatter = DateFormat('MM/dd/yyyy');
  final String formattedDate = formatter.format(value);
  return formattedDate;
}

DocumentReference parseUserDocument(String? documentId) {
  final documentReference =
      FirebaseFirestore.instance.collection('users').doc(documentId);
  return documentReference;
}
