import 'package:equatable/equatable.dart';

class PostType extends Equatable{
  int id;
  String title;
  String body ;

  PostType({
    required this.id,
    required this.title,
    required this.body
});

  @override
  List<Object?> get props => [id,title,body];

}