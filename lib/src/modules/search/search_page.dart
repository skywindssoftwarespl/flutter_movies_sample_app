import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/model/movie_model.dart';
import '../movie_detail/movie_detail_screen.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchPage extends StatelessWidget {
  final List<SearchModel> movieList;

  const SearchPage({required this.movieList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieSearchBloc(movieList),
      child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movie Search'),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search by Title or Year',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      context.read<MovieSearchBloc>().add(SearchMovies(query));
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
                    builder: (context, state) {
                      if (state is MovieSearchInitial) {
                        return const Center(child: Text('Enter movie or year'));
                      } else if (state is MovieSearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is MovieSearchLoaded) {
                        return ListView.builder(
                          itemCount: state.filteredMovies.length,
                          itemBuilder: (context, index) {
                            final movie = state.filteredMovies[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MovieDetailPage(
                                              movie: movie,
                                            )));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: Image.network(movie.Poster, width: 50),
                                  title: Text(movie.Title),
                                  subtitle: Text('${movie.Year} - ${movie.Type}'),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is MovieSearchError) {
                        return Center(child: Text(state.message));
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
