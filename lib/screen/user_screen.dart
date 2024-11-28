import 'package:api_integration/model/movie.dart';
import 'package:api_integration/api/api_alternative.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dados do usuário'),),
      body: ValueListenableBuilder<List<Movie>?>(
        valueListenable: repository.userNotifier,
        builder: (context, movies, child) {
          return movies == null
              ? const CircularProgressIndicator()
              : CarouselSlider.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index, movieIndex) {
                    final movie = movies[index];
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.4,
                      autoPlayInterval: const Duration(seconds: 3)),
                );
        },
      )
    );
  }
}