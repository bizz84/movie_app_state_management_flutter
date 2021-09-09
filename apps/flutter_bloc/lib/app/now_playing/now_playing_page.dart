import 'package:core/api/tmdb_api.dart';
import 'package:core/models/app_state/now_playing_state.dart';
import 'package:core/ui/scrollable_movies_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_demo_flutter/app/now_playing/favourite_movies_grid.dart';
import 'package:movie_app_demo_flutter/app/now_playing/now_playing_cubit.dart';

class NowPlayingPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider<NowPlayingCubit>(
      create: (_) => NowPlayingCubit(api: TMDBClient()),
      child: NowPlayingPage(),
    );
  }

  static const moviesGridKey = Key('moviesGrid');

  @override
  Widget build(BuildContext context) {
    return ScrollableMoviesPageBuilder(
      title: 'Now Playing',
      onNextPageRequested: () {
        final moviesCubit = BlocProvider.of<NowPlayingCubit>(context);
        moviesCubit.fetchNextPage();
      },
      builder: (context, controller) {
        return BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
            return state.when(
              data: (movies, _) => FavouritesMovieGrid(
                key: moviesGridKey,
                movies: movies,
                controller: controller,
              ),
              dataLoading: (movies) {
                return movies.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FavouritesMovieGrid(
                        key: moviesGridKey,
                        movies: movies,
                        controller: controller,
                      );
              },
              error: (error) => Center(child: Text(error)),
            );
          },
        );
      },
    );
  }
}
