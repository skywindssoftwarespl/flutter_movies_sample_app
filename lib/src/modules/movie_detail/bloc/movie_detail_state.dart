import 'package:equatable/equatable.dart';
import '../../Home/model/movie_model.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

// Initial state when the page is first loaded
class MovieDetailInitial extends MovieDetailState {}

// State that indicates the bookmark has been toggled
class MovieDetailToggled extends MovieDetailState {
  final List<SearchModel> bookmarkedMovies;

  const MovieDetailToggled(this.bookmarkedMovies);

  @override
  List<Object?> get props => [bookmarkedMovies];
}

// State when bookmarks are loaded
class MovieBookmarksLoaded extends MovieDetailState {
  final List<SearchModel> bookmarkedMovies;

  const MovieBookmarksLoaded(this.bookmarkedMovies);

  @override
  List<Object?> get props => [bookmarkedMovies];
}
