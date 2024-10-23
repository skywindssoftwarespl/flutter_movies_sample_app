import 'package:auto_route/auto_route.dart';
import 'package:demo/src/modules/Home/bloc/home_bloc.dart';
import 'package:demo/src/modules/Home/bloc/home_event.dart';
import 'package:demo/src/modules/Home/bloc/home_state.dart';
import 'package:demo/src/modules/Home/widget/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bookmark/bookmark_page.dart';
import '../search/search_page.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc()..add(FetchHomeData()),
      child: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        if (state is HomeLoaded) {
          return SafeArea(
            child: Scaffold(
                drawer: Drawer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarkPage()));
                        },
                        child: ListTile(
                          title: Text("Bookmark "),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
                appBar: AppBar(
                  title: Text(
                    "Home ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(
                                    movieList: state.movieList,
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
                body: BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is HomeLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [MovieCardWidget()],
                        ),
                      );
                    } else if (state is HomeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox();
                  },
                )),
          );
        }
        return SizedBox();
      }),
    );
  }
}
