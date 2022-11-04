


import 'package:clean_architecture_app/error/failures.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/reposDomain/repos_domain.dart';
import 'package:dartz/dartz.dart';


class AddPostUseCase {
  final PostRepos repos ;

  AddPostUseCase(this.repos);

  Future<Either<Failure, Unit>> call(PostType post) async{
    return await repos.addPost(post);
  }
}