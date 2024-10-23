import '../model/movie_model.dart';

abstract class HomePageState {}

class HomeLoading extends HomePageState {}

class HomeLoaded extends HomePageState {
  final List<SearchModel>  movieList;

  HomeLoaded(this.movieList);
}

class HomeError extends HomePageState {}

