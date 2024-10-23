import 'package:equatable/equatable.dart';
import '../../Home/model/movie_model.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object?> get props => [];
}
class BookmarkInitial extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<SearchModel> bookmarkedMovies;

  const BookmarkLoaded(this.bookmarkedMovies);

  @override
  List<Object?> get props => [bookmarkedMovies];
}
