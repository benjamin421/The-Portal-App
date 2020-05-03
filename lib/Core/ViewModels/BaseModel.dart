import 'package:flutter/foundation.dart';
import 'package:fiber/Core/Enums/ViewState.dart';
import 'package:fiber/Core/Services/NavigationService.dart';

import 'package:fiber/Core/Helpers/Locator.dart';

class BaseModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  NavigationService get navigationService => _navigationService;

  ViewState _state = ViewState.Idle;
  ViewState get viewState => _state;

  String errorMessage;

  bool mounted = true;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (mounted) super.notifyListeners();
  }
}
