
import 'package:clean_architecture_app/features/postCleanHome/domain/entities/entities.dart';

class Postmodel extends PostType {

     Postmodel({required id,required title,required body}) : super(id:id, title:title,body: body);

  factory Postmodel.fromJson(Map<String, dynamic> json) {

    return Postmodel(id: json['id'], title:json['title'] , body:json['body'] );

  }

  Map<String, dynamic> toJson() {

    return {'id':id,'title':title,'body':body};

  }
}
