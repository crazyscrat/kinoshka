import 'package:flutter/cupertino.dart';
import 'package:kinoshka/domain/api_client/api_client.dart';
import 'package:kinoshka/entity/docs.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';
import 'package:kinoshka/entity/tests.dart';
import 'package:kinoshka/navigation/main_navigation.dart';

class MainScreenModel extends ChangeNotifier{
  List<SearchMovieDtoV14> top250 = <SearchMovieDtoV14>[];// = Tests.top250;
  late Docs _docs;

  // MainScreenModel(){
  //   //getTop250();
  // }

  Future<void> getTop250({int page = 1}) async{
    _docs = await ApiClient().getTop250(page: page);
    top250 = _docs.docs!;

    notifyListeners();
  }

  Future<void> getNextPageTop250() async {
    var nextPage = _docs.page! + 1;
    if(nextPage > _docs.pages!) return;

    _docs = await ApiClient().getTop250(page: nextPage);
    top250.addAll(_docs.docs!);

    notifyListeners();
  }

  void selectMovie(BuildContext context, int index) {
    //open screen for movie info
    final movie = top250[index];
    print('SELECT MOVIE ${movie.name}');

    Navigator.of(context).pushNamed(MainNavigationRouteNames.movieScreen, arguments: movie);
  }
}
