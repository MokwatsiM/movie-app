import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wookie/utils/loading.dart';
import 'package:wookie/view_models/movie_view_model.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 300,
      child: ListView.builder(
          itemCount: movieViewModel?.movieList?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            var item = movieViewModel?.movieList[index];
            return Container(
              width: 160,
              child: Card(
                  child: Material(
                elevation: 32,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      item.poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
            );
          }),
    );
  }
}
