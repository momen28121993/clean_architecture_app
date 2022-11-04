
import 'package:clean_architecture_app/error/exceptions.dart';
import 'package:clean_architecture_app/error/failures.dart';
import 'package:clean_architecture_app/features/postCleanHome/data/dataSources/local_data_source.dart';
import 'package:clean_architecture_app/features/postCleanHome/data/dataSources/remote_data_source.dart';
import 'package:clean_architecture_app/features/postCleanHome/data/model/post_model.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/reposDomain/repos_domain.dart';
import 'package:clean_architecture_app/networkCase/network_case.dart';
import 'package:dartz/dartz.dart';

class ReposImpleToData extends PostRepos{

final RemoteDataSource postRemoteDataSource ;
final  LocaleDataSource postLocalDataSource ;
final NetworkCase network ;




  ReposImpleToData( {required this.network, required this.postRemoteDataSource,required this.postLocalDataSource});

  @override
Future<Either<Failure, List<PostType>>> getPostes() async{
    final remotPostes =  await postRemoteDataSource.getpostes();
    if(await network.internetConnection){
      try{
      postLocalDataSource.CachPosts(remotPostes);
      return Right(remotPostes);
      }
     on ServerException{
        return Left(ServerProblem());
      }

    }else{
      try{
       final List<Postmodel> localPosts = await postLocalDataSource.getCachPosts();
        return Right(localPosts);
      }on CatchExceptions {
        return Left(CachEmpty());
      }
    }
    
}


  @override
  Future<Either<Failure, Unit>> addPost(PostType post) async{
    final Postmodel postModel = Postmodel(id: post.id, title: post.title, body: post.body);
   if (await network.internetConnection){
     try{
      await postRemoteDataSource.addPost(postModel);
      return Right(unit);
     }on ServerException {
       return left(ServerProblem());
     }
   }else{
     return left(Offline());
   }
    
  }



  @override
  Future<Either<Failure, Unit>> removePost(int id) async{
    if(await network.internetConnection){
      try {
        await postRemoteDataSource.removePost(id);
        return right(unit);
      } on ServerException {
        return left(ServerProblem());
      }
    }else{
      return left(Offline());
    }

  }
  
}

