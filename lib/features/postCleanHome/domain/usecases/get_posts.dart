
import 'package:clean_architecture_app/error/failures.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/reposDomain/repos_domain.dart';
import 'package:dartz/dartz.dart';


class GetPostsUserCase{
  final PostRepos repos;

  GetPostsUserCase(this.repos);

  Future<Either<Failure, List<PostType>>> call() async{
   return await repos.getPostes();
  }
}