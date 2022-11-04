import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkCase {
  Future<bool> get internetConnection ;
}

class connectionCase implements NetworkCase{
  @override

  Future<bool> get internetConnection => InternetConnectionChecker().hasConnection ;


}