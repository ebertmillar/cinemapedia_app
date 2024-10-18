
import 'package:cinemapedia_app/config/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_app/config/domain/entities/actor.dart';
import 'package:cinemapedia_app/config/domain/repositories/actors_repository.dart';

class ActorMovidbRepositoryImpl extends ActorsRepository{

  final ActorsDatasource datasource;

  ActorMovidbRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    return datasource.getActorsByMovie(movieId);
  }


}