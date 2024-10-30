import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is !PostActionState,
        listener: (context, state) {

        },
        builder: (context, state) {

          switch(state.runtimeType){

            case PostFetchingSuccessfulState:
              final successState = state as PostFetchingSuccessfulState;
              return Container(
                child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index){
                      return Container(
                        child: Column(
                          children: [
                            Text(successState.posts[index].title)
                          ],
                        ),
                      );
                    }),
              );

            default: SizedBox();

          }

          return SizedBox();
        },
      ),
    );
  }
}
