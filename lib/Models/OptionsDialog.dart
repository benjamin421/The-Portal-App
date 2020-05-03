import 'DialogButtonAction.dart';
import 'Dialog.dart';

class OptionsDialog extends DialogModel {
  String title;
  String description;
  List<DialogButtonAction> actions;
  static const DialogType type = DialogType.Options;

  OptionsDialog({this.title, this.description, this.actions})
      : super(
          title: title,
          description: description,
          dialogType: type,
        );
}
