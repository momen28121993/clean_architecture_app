
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import '../../../../error/failures.dart';

abstract class PostRepos {

  Future<Either<Failure,List<PostType>>>getPostes();
  Future<Either<Failure,Unit>> removePost(int id);
  Future<Either<Failure,Unit>> addPost(PostType post);

}