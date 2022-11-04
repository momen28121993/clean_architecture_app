import 'dart:convert';
import 'package:clean_architecture_app/error/exceptions.dart';
import 'package:clean_architecture_app/features/postCleanHome/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class LocaleDataSource {
  Future<Unit> CachPosts(List<Postmodel> postsModels) ;
  Future<List<Postmodel>> getCachPosts() ;


}

class LocalDataimpl implements LocaleDataSource {
final SharedPreferences sharedPreferences ;
  LocalDataimpl({required this.sharedPreferences});

  @override
  Future<Unit> CachPosts(List<Postmodel> postsModels) {
 List postModelTojson = postsModels.map<Map<String,dynamic>>((postmodel) => postmodel.toJson()).toList();

    sharedPreferences.setString("CACHED_Posts", json.encode(postModelTojson));
    return Future.value(unit) ;
  }

  @override
  Future<List<Postmodel>> getCachPosts() {

    final jsonString = sharedPreferences.getString("CACHED_Posts");
    if(jsonString != null){
      List decodJsonData = json.decode(jsonString);
      List<Postmodel> jsonToPostmodel = decodJsonData.map<Postmodel>((jsonPostModel) => Postmodel.fromJson(jsonPostModel)).toList();
      return Future.value(jsonToPostmodel);
    }else{
      throw CatchExceptions();
    }
  }

}
