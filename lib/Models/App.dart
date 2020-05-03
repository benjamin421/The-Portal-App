class App {
  int _navigationIndex = 0;
  bool _tokenExpired = false;

  bool get tokenExpired => _tokenExpired;
  int get navigationIndex => _navigationIndex;

  App() {
    this._tokenExpired = false;
  }

  set tokenExpired(tokenExpired) {
    _tokenExpired = tokenExpired;
  }

  set navigationIndex(index) {
    _navigationIndex = index;
  }
}
