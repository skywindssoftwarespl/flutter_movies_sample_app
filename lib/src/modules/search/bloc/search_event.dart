import 'package:equatable/equatable.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMovies extends MovieSearchEvent {
  final String query;

  const SearchMovies(this.query);

  @override
  List<Object> get props => [query];
}
