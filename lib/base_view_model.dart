import 'package:flutter/foundation.dart';
import 'package:kpie_assessment/utils/Enum/view_state.dart';



class BaseViewModel extends ChangeNotifier {
  bool _disposed = false;
  bool get isDisposed => _disposed;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  bool get isBusy => _state == ViewState.busy;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  setBusy(ViewState currentState) {
    _state = currentState;
    if (!_disposed) notifyListeners();
  }
}