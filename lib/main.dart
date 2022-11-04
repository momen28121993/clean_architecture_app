import 'package:flutter/material.dart';
import 'features/postCleanHome/presentation/screens/post_clean_home.dart';
import 'package:provider/provider.dart';
import 'features/postCleanHome/presentation/provider/post_provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(create: (context) => PostProvider()),
      ],
      child: MaterialApp(
        home: PostCleanHome(),
      ),
    );
  }
}

// https://jsonplaceholder.typicode.com/posts     my api path