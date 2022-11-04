import 'dart:convert';
import 'package:clean_architecture_app/error/exceptions.dart';
import 'package:clean_architecture_app/features/postCleanHome/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http ;

abstract class RemoteDataSource {
  Future<List<Postmodel>> getpostes();
  Future<Unit> addPost(Postmodel post);
  Future<Unit> removePost(int id);
}

class remoteDatawithHttp implements RemoteDataSource{
 final  http.Client client ;
  remoteDatawithHttp(this.client);
  @override
  Future<Unit> addPost(Postmodel post) async {

  final body = {
    "title" : post.title ,
    "body" : post.body ,
  };
  final response =await client.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),body: body);
  if(response.statusCode==201){
    return Future.value(unit);
  }else{
    throw ServerException();
  }

  }

  @override
  Future<List<Postmodel>> getpostes() async{
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    List decodJson = jsonDecode(response.body) as List ;
    List<Postmodel> allPostes = decodJson.map<Postmodel>((JsontoPostModel) => Postmodel.fromJson(JsontoPostModel)).toList();
    if(response.statusCode==200){
      return allPostes ;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> removePost(int id) async{
  final response =await client.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if(response.statusCode==200){
    return Future.value(unit);
  }else{
    throw ServerException();
  }
  }
}