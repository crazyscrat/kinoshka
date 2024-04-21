import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kinoshka/domain/api_client/api_client.dart';
import 'package:kinoshka/entity/fact_in_movie.dart';
import 'package:kinoshka/entity/movie_dto_v14.dart';
import 'package:kinoshka/entity/person_in_movie.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';

class MovieScreenModel extends ChangeNotifier {
  final SearchMovieDtoV14 movie;
  MovieDtoV14 _movieFullInfo = MovieDtoV14(id: 0);
  List<PersonInMovie> _persons = <PersonInMovie>[];

  MovieDtoV14 get movieFullInfo => _movieFullInfo;

  MovieScreenModel(this.movie) {
    //loadInfoById();
  }

  Future<void> loadInfoById() async{
    ApiClient client = ApiClient();
    _movieFullInfo = await client.getMovieFullInfo(id: movie.id);

    _persons = _movieFullInfo.persons!.where((element) => element.enProfession == 'actor').toList();

    notifyListeners();
  }

  String getGenres(){
    var genres = '';
    if(_movieFullInfo.genres != null) {
      int length = _movieFullInfo.genres?.length as int;
      for (var i = 0; i < length; i++) {
        genres += _movieFullInfo.genres![i];
        if(i + 1 < length) {
          genres += ', ';
        }
      }
    }
    return genres;
  }

  String getCountries(){
    String countries = '';
    if(_movieFullInfo.countries != null) {
      int length = _movieFullInfo.countries?.length as int;
      for (var i = 0; i < length; i++) {
        countries += _movieFullInfo.countries![i];
        if(i + 1 < length) {
          countries += ', ';
        }
      }
    }
    return countries;
  }

  int factIndex = 0;
  FactInMovie? getNextFact(){
    FactInMovie fact;
    if(_movieFullInfo.facts != null) {
      int length = _movieFullInfo.facts?.length as int;
      if(factIndex < length){
        fact = FactInMovie(value: _movieFullInfo.facts![factIndex].value);
        fact.type = _movieFullInfo.facts?[factIndex].type ?? '';
        fact.spoiler = _movieFullInfo.facts?[factIndex].spoiler;
        factIndex += 1;

        return fact;
      }
    }
    return FactInMovie(value: '');
  }

  int personIndex = 0;
  PersonInMovie? getNextPerson(){
    PersonInMovie person;
    int length = _persons.length;
    if(personIndex < length){
      while(_persons[personIndex].enProfession != 'actor'){
        personIndex += 1;
        if(personIndex >= length){
          return PersonInMovie(id: 0);
        }
      }
      person = _persons[personIndex];
      personIndex += 1;

      return person;
    }
      return PersonInMovie(id: 0);
  }

  int getPersonsCont(){
    int length = _persons.length;
    if(length % 2 == 0){
      return length~/2;
    }else{
      return length~/2 + 1;
    }
  }

  String getType(){
    String type = '';
    switch(_movieFullInfo.type){
      case 'movie': type = 'Полнометражный фильм';
    }
    return type;
  }
}
