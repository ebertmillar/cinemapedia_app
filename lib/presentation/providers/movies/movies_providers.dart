import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movie_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//typedef para especificar el tipo de funcion que espero
typedef MovieCallback = Future<List<Movie>> Function({int page});

//notifier o control
class MoviesNotifier extends StateNotifier<List<Movie>> {
  //pagina actual
  int currentPage = 0;
  bool isLoading = false;

  //buscar mas peliculas
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {

    if(isLoading) return;

    isLoading =true;
    currentPage++;
    final List<Movie> movie = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movie];
    
    await Future.delayed(const Duration(microseconds: 300));
    isLoading =false;
  }
}
