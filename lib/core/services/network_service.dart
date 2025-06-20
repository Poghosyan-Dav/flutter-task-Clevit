import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkService {
final Connectivity _connectivity = Connectivity();

Future<bool> isConnected() async {
final result = await _connectivity.checkConnectivity();
return result != ConnectivityResult.none;
}

Stream<bool> get onStatusChanged async* {
await for (var result in _connectivity.onConnectivityChanged) {
yield result != ConnectivityResult.none;
}
}
}