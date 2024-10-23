import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/model/movie_model.dart';
import 'search_event.dart';
import 'search_state.dart';


class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final List<SearchModel> movieList;

  MovieSearchBloc(this.movieList) : super(MovieSearchInitial()) {
    //search query in movie list
    on<SearchMovies>((event, emit) {
      emit(MovieSearchLoading());

      final query = event.query.toLowerCase();
      final filteredMovies = movieList.where((movie) {
        return movie.Title.toLowerCase().contains(query) ||
               movie.Year.contains(query);
      }).toList();

      if (filteredMovies.isEmpty) {
        emit(MovieSearchError('No movies found.'));
      } else {
        emit(MovieSearchLoaded(filteredMovies));
      }
    });
  }
}
