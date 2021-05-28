// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cross_connectivity/cross_connectivity.dart' as cc;

// Project imports:
import '../base/logger.dart';

mixin NetworkAwareState<T extends StatefulWidget> on State<T> {
  bool _isDisconnected = false;
  final Logger log = getLogger('Network Notifier');

  late StreamSubscription<bool> _networkSubscription;
  final cc.Connectivity _connectivity = cc.Connectivity();

  void onReconnected();

  void onDisconnected();

  bool firstCallback = true;

  Future<void> initConnectivity() async {
    late bool result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnection();
    } on Exception catch (e) {
      log.e(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  void initState() {
    super.initState();
    //listen to network changes
    initConnectivity();
    _networkSubscription = _connectivity.isConnected.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(bool result) {
    if (result) {
      if (_isDisconnected) {
        // do something
        onReconnected();
        _isDisconnected = false;
      }
    } else {
      // do something
      _isDisconnected = true;
      onDisconnected();
    }
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }

  void cancelSubscription() {
    try {
      _networkSubscription.cancel();
    } catch (e) {
      log.e(e);
    }
  }
}
