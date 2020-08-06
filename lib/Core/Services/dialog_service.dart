import 'dart:async';
import 'package:fiber/Models/Dialog.dart';
import 'package:fiber/Models/DialogButtonAction.dart';
import 'package:fiber/Models/OptionsDialog.dart';

class DialogService {
  Function(DialogModel) _showDialogListener;
  Completer<dynamic> _dialogCompleter;

  void registerDialogListener(Function(DialogModel) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<dynamic> showAlertDialog(
      {String title, String description, String buttonText}) {
    _dialogCompleter = Completer<dynamic>();
    _showDialogListener(DialogModel(
      title: title,
      description: description,
      buttonText: buttonText,
    ));
    return _dialogCompleter.future;
  }

  Future<dynamic> showOptionsDialog(
      {String title, String description, List<DialogButtonAction> actions}) {
    _dialogCompleter = Completer<dynamic>();
    _showDialogListener(OptionsDialog(
        title: title, description: description, actions: actions));
    return _dialogCompleter.future;
  }

  void dialogComplete(dynamic response) {
    if (_dialogCompleter != null) {
      _dialogCompleter.complete(response);
      _dialogCompleter = null;
    }
  }
}
