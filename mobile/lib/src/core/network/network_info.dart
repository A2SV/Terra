import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Network {
  Future<bool> get isConnected;
}

class NetworkImpl implements Network {
  final InternetConnectionChecker connectionChecker;

  NetworkImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected =>  connectionChecker.hasConnection;
}