import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movie_detail/movie_detail_screen.dart';
import 'bloc/bookmark_bloc.dart';
import 'bloc/bookmark_event.dart';
import 'bloc/bookmark_state.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Movies'),
      ),
      body: BlocProvider(
        create: (context) => BookmarkBloc(),
        child: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkInitial) {
              context.read<BookmarkBloc>().add(LoadBookmarksEvent());
            }

            if (state is BookmarkLoaded) {
              if (state.bookmarkedMovies.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.bookmarkedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.bookmarkedMovies[index];
                    return ListTile(
                      leading: Image.network(movie.Poster, width: 50),
                      title: Text(movie.Title),
                      subtitle: Text('${movie.Year} - ${movie.Type}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          context.read<BookmarkBloc>().add(ToggleBookmarkEvent(movie));
                          context.read<BookmarkBloc>().add(LoadBookmarksEvent());
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailPage(movie: movie),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No bookmarked movies found.'),
                );
              }
            } else if (state is BookmarkInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text('Error loading bookmarks.'),
              );
            }
          },
        ),
      ),
    );
  }
}
