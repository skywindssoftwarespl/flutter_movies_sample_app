import 'package:equatable/equatable.dart';
import '../../Home/model/movie_model.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class ToggleBookmarkEvent extends MovieDetailEvent {
  final SearchModel movie;

  const ToggleBookmarkEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

// Event for loading bookmarks
class LoadBookmarksEvent extends MovieDetailEvent {}
