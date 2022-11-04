

import 'package:clean_architecture_app/error/failures.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';
import 'package:clean_architecture_app/features/postCleanHome/domain/usecases/get_posts.dart';
import 'package:clean_architecture_app/features/postCleanHome/presentation/provider/post_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
class PostProvider extends ChangeNotifier {

  final GetPostsUserCase getPostsUserCase ;
  PostProvider({required this.getPostsUserCase});

}
class Getposts extends PostProvider {
  Getposts({required super.getPostsUserCase});
  getPost ()async{
    final posts = await getPostsUserCase() ;
    posts.fold(
            (failure) {
              
            } ,
            (posts) => {}
    );
  }
}
