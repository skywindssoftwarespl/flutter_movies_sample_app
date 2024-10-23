import 'package:demo/src/modules/Home/bloc/home_bloc.dart';
import 'package:demo/src/modules/Home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widget/cache_network_image.dart';
import '../../movie_detail/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  MovieCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Column(
                  children: List.generate(state.movieList.length, (int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailPage(
                                  movie: state.movieList[index],
                                )));
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Colors.white,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              child: CustomImageView(
                                fit: BoxFit.cover,
                                url: state.movieList[index].Poster,
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    child: Text(
                                        maxLines: 1, state.movieList[index].Title, overflow: TextOverflow.ellipsis))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(state.movieList[index].Year),
                            )
                          ]))),
                );
              }));
            }
            return SizedBox();
          },
        )
      ]),
    );
  }
}
