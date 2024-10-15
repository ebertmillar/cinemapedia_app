
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/infrastructure/repositories/themoviedb_repository_impl.dart';
import 'package:cinemapedia_app/infrastructure/datasources/themoviedb_datasource.dart';

//Este repositorio es de solo lectura  -inmutable
final movieRepositoryProvider = Provider((ref) {
  return ThemoviedbRepositoryImpl(ThemoviedbDatasource());
});