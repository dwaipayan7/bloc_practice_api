import 'package:bloc_practice_api/feature/home/home_page.dart';
import 'package:bloc_practice_api/feature/posts/bloc/posts_bloc.dart';
import 'package:bloc_practice_api/feature/posts/ui/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> PostsBloc())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bloc API ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: PostPage(),
        ),
    );
  }
}

