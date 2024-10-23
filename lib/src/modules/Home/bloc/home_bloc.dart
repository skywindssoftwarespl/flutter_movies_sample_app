import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/movie_model.dart';
import '../../../../core/network/repository/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepository? userRepository;
  HomePageBloc()
      : userRepository = UserRepository(),
        super(HomeLoading()) {
    on<FetchHomeData>(_fetchData);
    add(FetchHomeData());
  }

  // fetch data from API
  _fetchData(FetchHomeData event, Emitter<HomePageState> emit) async {
    MoviesModel? moviesModel = await userRepository?.fetchData();
    emit(HomeLoaded(moviesModel?.search ?? []));
  }
}
