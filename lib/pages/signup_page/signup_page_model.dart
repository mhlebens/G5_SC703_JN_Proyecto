import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  // State field(s) for BirthdayInput widget.
  FocusNode? birthdayInputFocusNode;
  TextEditingController? birthdayInputTextController;
  String? Function(BuildContext, String?)? birthdayInputTextControllerValidator;
  // State field(s) for PasswordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  // State field(s) for ConfirmPasswordInput widget.
  FocusNode? confirmPasswordInputFocusNode;
  TextEditingController? confirmPasswordInputTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordInputTextControllerValidator;
  // Stores action output result for [Custom Action - parseDate] action in SignUpBtn widget.
  DateTime? birthdate;
  // Stores action output result for [Custom Action - encryptText] action in SignUpBtn widget.
  String? password;
  // Stores action output result for [Backend Call - Create Document] action in SignUpBtn widget.
  UsersRecord? result;
  // Stores action output result for [Backend Call - API (CreateJWT)] action in SignUpBtn widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    nicknameInputFocusNode?.dispose();
    nicknameInputTextController?.dispose();

    birthdayInputFocusNode?.dispose();
    birthdayInputTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();

    confirmPasswordInputFocusNode?.dispose();
    confirmPasswordInputTextController?.dispose();
  }
}
