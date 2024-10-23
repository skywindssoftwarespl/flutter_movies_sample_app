import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Home/model/movie_model.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  List<SearchModel> bookmarkedMovies = [];

  BookmarkBloc() : super(BookmarkInitial()) {
    on<LoadBookmarksEvent>((event, emit) async {
      await _loadBookmarks();
      emit(BookmarkLoaded(bookmarkedMovies));
    });

    on<ToggleBookmarkEvent>((event, emit) async {
      if (bookmarkedMovies.contains(event.movie)) {
        bookmarkedMovies.remove(event.movie);
      } else {
        bookmarkedMovies.add(event.movie);
      }
      await _saveBookmarks();
      emit(BookmarkLoaded(List.from(bookmarkedMovies)));
    });
  }

  // to save bookmark to local storage
  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedJson = bookmarkedMovies.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('bookmarked_movies', bookmarkedJson);
  }

  //  to load bookmark from local storage
  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkedJson = prefs.getStringList('bookmarked_movies') ?? [];

    bookmarkedMovies = bookmarkedJson.map((e) => SearchModel.fromJson(jsonDecode(e))).toList();
  }
}




// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../Home/model/movie_model.dart';
// import 'bookmark_event.dart';
// import 'bookmark_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert'; 

// class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
//   List<SearchModel> bookmarkedMovies = [];

//   BookmarkBloc() : super(BookmarkInitial()) {
//     on<LoadBookmarksEvent>((event, emit) async {
//       await _loadBookmarks();
//       emit(BookmarkLoaded(bookmarkedMovies));
//     });

//     on<ToggleBookmarkEvent>((event, emit) async {
//       if (bookmarkedMovies.contains(event.movie)) {
//         bookmarkedMovies.remove(event.movie);
//       } else {
//         bookmarkedMovies.add(event.movie);
//       }
//       await _saveBookmarks(); 
//       emit(BookmarkLoaded(List.from(bookmarkedMovies)));
//     });
//   }

//   Future<void> _saveBookmarks() async {
//     final prefs = await SharedPreferences.getInstance();
//     final bookmarkedJson = bookmarkedMovies.map((e) => jsonEncode(e.toJson())).toList();
//     prefs.setStringList('bookmarked_movies', bookmarkedJson);
//   }

//   Future<void> _loadBookmarks() async {
//     final prefs = await SharedPreferences.getInstance();
//     final bookmarkedJson = prefs.getStringList('bookmarked_movies') ?? [];

//     bookmarkedMovies = bookmarkedJson
//         .map((e) => SearchModel.fromJson(jsonDecode(e)))
//         .toList();
//   }
// }
