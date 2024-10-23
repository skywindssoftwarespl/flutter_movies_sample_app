import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/model/movie_model.dart';
import 'bloc/movie_detail_bloc.dart';
import 'bloc/movie_detail_event.dart';
import 'bloc/movie_detail_state.dart';

class MovieDetailPage extends StatelessWidget {
  final SearchModel movie;

  const MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc()..add(LoadBookmarksEvent()), // Load bookmarks on creation
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.Title),
          actions: [
            BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                bool isBookmarked = false;

                // if the movie is bookmarked based on the current state
                if (state is MovieDetailToggled) {
                  isBookmarked = state.bookmarkedMovies.contains(movie);
                } else if (state is MovieBookmarksLoaded) {
                  isBookmarked = state.bookmarkedMovies.contains(movie);
                }

                return IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.green : Colors.black,
                  ),
                  onPressed: () {
                    context.read<MovieDetailBloc>().add(ToggleBookmarkEvent(movie));
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.Poster,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    movie.Title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Year: ${movie.Year}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Type: ${movie.Type}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
