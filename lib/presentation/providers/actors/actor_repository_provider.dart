
//Este repositorio es de solo lectura  -inmutable
import 'package:cinemapedia_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actor_movidb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorMovidbRepositoryImpl(ActorMoviedbDatasource());
});