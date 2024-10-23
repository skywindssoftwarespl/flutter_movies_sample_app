import 'package:equatable/equatable.dart';
import '../../Home/model/movie_model.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookmarksEvent extends BookmarkEvent {}

class ToggleBookmarkEvent extends BookmarkEvent {
  final SearchModel movie;

  const ToggleBookmarkEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}
