import 'package:connectivity_plus/connectivity_plus.dart';

Stream<bool> checkInternetconnectivity() async* {
  final connectivity = await Connectivity().checkConnectivity();
  if (connectivity.contains(ConnectivityResult.none)) {
    yield false;
  } else {
    yield true;
  }
  await for (var result in Connectivity().onConnectivityChanged) {
    if (result.contains(ConnectivityResult.none)) {
      yield false;
    } else {
      yield true;
    }
  }
}
