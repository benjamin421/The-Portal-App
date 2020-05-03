import 'package:flutter/material.dart';
import 'package:fiber/Core/Helpers/Locator.dart';
import 'package:fiber/Models/Dialog.dart';
import 'package:fiber/Models/OptionsDialog.dart';

import 'package:fiber/Core/Services/DialogService.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);
  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  _showDialog(DialogModel alert) async {
    showDialog(
        context: context,
        builder: (_) {
          switch (alert.dialogType) {
            case DialogType.Dialog:
              return AlertDialog(actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _dialogService.dialogComplete(true);
                    Navigator.of(context).pop();
                  },
                  child: Text(alert.buttonText),
                ),
              ], title: Text(alert.title), content: Text(alert.description));
            case DialogType.Options:
              var dialog = alert as OptionsDialog;
              return AlertDialog(
                  actions: dialog.actions
                      .map(
                        (button) => FlatButton(
                          onPressed: () {
                            _dialogService.dialogComplete(button.response);
                            Navigator.of(context).pop();
                          },
                          child: Text(button.name),
                        ),
                      )
                      .toList(),
                  title: Text(alert.title),
                  content: Text(alert.description));
            default:
              break;
          }
        }).then((_) {
      _dialogService.dialogComplete(null);
    });
  }
}
