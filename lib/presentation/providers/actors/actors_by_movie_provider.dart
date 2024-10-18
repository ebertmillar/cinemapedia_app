
//typedef para especificar el tipo de funcion que espero
import 'package:cinemapedia_app/config/domain/entities/actor.dart';
import 'package:cinemapedia_app/presentation/providers/actors/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorsByMovieNotifier(getActors: actorsRepository);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

//notifier o control
class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {
  //pagina actual
  int currentPage = 0;
  bool isLoading = false;

  //buscar mas peliculas
  GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors( String movieId) async {
    
    if ( state[movieId] != null ) return;
    final List<Actor> actors = await getActors (movieId);
    state = { ...state, movieId: actors };

  }

}