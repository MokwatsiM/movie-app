import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wookie/data/models/movie_model.dart';
import 'package:wookie/utils/loading.dart';
import 'package:wookie/view_models/movie_view_model.dart';
import 'package:wookie/views/home/pages/movie_detail_page.dart';
import 'package:wookie/views/home/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MovieViewModel>(context, listen: false).getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Wookie Movies"),
        actions: [],
      ),
      body: Consumer<MovieViewModel>(builder:
          (BuildContext ctx, MovieViewModel movieViewModel, Widget myWidget) {
        return SafeArea(child: checkStatus(movieViewModel));
      }),
    );
  }

  checkStatus(MovieViewModel movieViewModel) {
    switch (movieViewModel.fetchState) {
      case LoadingStatus.done:
        return createList(movieViewModel);
      case LoadingStatus.error:
        return Container(child: Text("Error"));
      case LoadingStatus.fetching:
        return Center(child: CircularProgressIndicator());
      case LoadingStatus.not_fetched:
        return Container(child: Text("Error"));
    }
  }

  createList(MovieViewModel movieViewModel) {
    final genres = movieViewModel.movieList.map((m) => m.genres).toList();

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 300,
        child: Container(
            height: 120,
            child: ListView.builder(
                itemCount: genres.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var item = movieViewModel?.movieList[index];
                  return MovieCardWidget(
                    movies: item,
                    onSelected: (Movies viewModel) {
                      _showMovieDetail(context, item);
                    },
                  );
                })));
  }

  void _showMovieDetail(BuildContext context, Movies movie) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => MovieDetailPage(movies: movie)));
  }
}
