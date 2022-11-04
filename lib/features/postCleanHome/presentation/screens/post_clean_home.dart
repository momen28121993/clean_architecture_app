import 'package:clean_architecture_app/features/postCleanHome/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCleanHome extends StatelessWidget {
  const PostCleanHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('postes'),
        leading: IconButton(
          icon: Icon(Icons.file_download),
          onPressed: ()async{

          }
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount:3,
            itemBuilder:(context, index) => Card(
              child: ListTile(
                title: Text('kj'),
                subtitle: Text('postbody'),
              ),
            ),
        ),
      )
    );
  }
}
