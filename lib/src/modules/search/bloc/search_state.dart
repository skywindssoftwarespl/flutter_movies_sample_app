import 'package:equatable/equatable.dart';
import '../../Home/model/movie_model.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchLoaded extends MovieSearchState {
  final List<SearchModel> filteredMovies;

  const MovieSearchLoaded(this.filteredMovies);

  @override
  List<Object> get props => [filteredMovies];
}

class MovieSearchError extends MovieSearchState {
  final String message;

  const MovieSearchError(this.message);

  @override
  List<Object> get props => [message];
}
