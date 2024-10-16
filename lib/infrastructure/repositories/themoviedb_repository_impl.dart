
import 'package:cinemapedia_app/config/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/domain/repositories/movies_repository.dart';

class ThemoviedbRepositoryImpl extends MoviesRepository {

  final MoviesDatasources datasource;

  ThemoviedbRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);   
  }



}