import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/model/movie_model.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; 

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  List<SearchModel> bookmarkedMovies = [];

  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<LoadBookmarksEvent>((event, emit) async {
      await _loadBookmarks(); // Load bookmarks from local storage
      emit(MovieBookmarksLoaded(List.from(bookmarkedMovies)));
    });

    on<ToggleBookmarkEvent>((event, emit) async {
      // Toggle bookmark state
      if (bookmarkedMovies.contains(event.movie)) {
        bookmarkedMovies.remove(event.movie);
      } else {
        bookmarkedMovies.add(event.movie);
      }
      await _saveBookmarks(); // Save bookmarks to local storage
      emit(MovieDetailToggled(List.from(bookmarkedMovies))); // Emit updated state
    });
  }

  // Check if a movie is bookmarked
  bool isBookmarked(SearchModel movie) {
    return bookmarkedMovies.contains(movie);
  }

  // Save bookmarks to SharedPreferences
  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedJson = bookmarkedMovies.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('bookmarked_movies', bookmarkedJson);
  }

  // Load bookmarks from SharedPreferences
  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedJson = prefs.getStringList('bookmarked_movies') ?? [];

    bookmarkedMovies = bookmarkedJson
        .map((e) => SearchModel.fromJson(jsonDecode(e)))
        .toList();
  }
}
