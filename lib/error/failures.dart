
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class Offline extends Failure{
  @override

  List<Object?> get props => [];
}

class ServerProblem extends Failure{
  @override
  List<Object?> get props => [];
}

class CachEmpty extends Failure{
  @override
  List<Object?> get props => [];
}