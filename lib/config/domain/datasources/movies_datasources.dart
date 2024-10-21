import 'package:cinemapedia_app/config/domain/entities/movie.dart';

abstract class MoviesDatasources {

  Future<List<Movie>> getNowPlaying({ int page =1 } );

  Future<List<Movie>> getPopular({ int page =1 } );

  Future<List<Movie>> getUpComing({ int page =1 } );
  
  Future<List<Movie>> getTopRated({ int page =1 } );

  Future<Movie> getMovieById( String id );

  Future<List<Movie>> searchMovie( String query );

}