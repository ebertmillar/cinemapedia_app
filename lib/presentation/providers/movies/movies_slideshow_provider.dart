
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if(nowPlayingMovies.isEmpty){
      return [];
    }else{
      return nowPlayingMovies.sublist(0,6);
    }
    
},);