import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final topRatingMovies = ref.watch(topRatingMoviesProvider).isEmpty;
  final upComingMovies = ref.watch(upComingMoviesProvider).isEmpty;

  if (nowPlayingMovies || popularMovies || topRatingMovies || upComingMovies){
    return true;
  }
  return false;
});
