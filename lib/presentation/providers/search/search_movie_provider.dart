
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movie_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) =>'');


final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(

    searchMovies: movieRepository.searchMovie, 
    ref: ref
  ); 

});

typedef SearchMoviesCallback = Future<List<Movie>> Function (String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  
  final SearchMoviesCallback searchMovies;
  final Ref ref;
  
  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }): super([]);

  Future<List<Movie>> searchMoviesByQuery ( String query) async {

    final List<Movie>  movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }



}