import 'package:api_integration/model/movie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data/const.dart';

class UserRepository {
  final dio = Dio();
  final String url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  ValueNotifier<List<Movie>> userNotifier = ValueNotifier([]);

  UserRepository() {
    getUser();
  }

  Future<void> getUser() async {
    try {
      final response = await dio.get(url);

      final List<Movie> movies = (response.data['results'] as List).map(
              (movieJson) => Movie.fromJson(movieJson)).toList();

      userNotifier.value = movies;
    } catch(e) {
      print(e);
    }
  }
}