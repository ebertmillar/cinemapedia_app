
import 'package:cinemapedia_app/config/domain/entities/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor getCastToEntity (
    Cast cast ) => Actor(
      id: cast.id, 
      name: cast.name, 
      profilePath: cast.profilePath != null 
        ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
        : 'https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg',
      character: cast.character
    );





}