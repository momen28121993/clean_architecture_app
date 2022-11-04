

import 'package:clean_architecture_app/error/failures.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/reposDomain/repos_domain.dart';
import 'package:dartz/dartz.dart';



class DeletPostUserCase {
  final PostRepos repos ;

  DeletPostUserCase(this.repos);

  Future<Either<Failure, Unit>> call(int postId) async{
    return await repos.removePost(postId);
  }
}