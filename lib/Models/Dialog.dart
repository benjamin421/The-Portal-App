enum DialogType { Dialog, Alert, Options }

class DialogModel {
  String title;
  String description;
  String buttonText;
  DialogType dialogType;

  DialogModel(
      {this.title,
      this.description,
      this.buttonText,
      this.dialogType = DialogType.Dialog});
}
