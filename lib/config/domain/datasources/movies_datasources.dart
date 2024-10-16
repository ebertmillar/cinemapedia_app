import 'package:cinemapedia_app/config/domain/entities/movie.dart';

abstract class MoviesDatasources {

  Future<List<Movie>> getNowPlaying({ int page =1 } );

  Future<List<Movie>> getPopular({ int page =1 } );

}