import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/community/domain/entities/post_entity.dart';
import 'package:study_buddy/features/community/domain/usecases/get_all_posts.dart';
import 'package:study_buddy/features/community/presentation/bloc/cubits/post_cubit.dart';
import 'package:study_buddy/features/community/presentation/bloc/states/post_state.dart';
import 'package:study_buddy/features/community/presentation/widgets/feed/achievement_card.dart';

class FeedContent extends StatelessWidget {
  const FeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: locator<GetAllPostsUseCase>()(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return index < snapshot.data!.length
                      ? BlocProvider(
                          create: (context) => PostCubit(snapshot.data![index]),
                          child: BlocBuilder<PostCubit, PostState>(
                            builder: (context, state) {
                              return AchievementCard(
                                post: state.post,
                              );
                            },
                          ),
                        )
                      : const SizedBox(
                          height: 100,
                        );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
