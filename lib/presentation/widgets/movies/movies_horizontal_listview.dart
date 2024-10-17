import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/domain/entities/movie.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<MoviesHorizontalListview> createState() => _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if( (scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent){
        widget.loadNextPage!();
      }

    },);
   
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(movie: widget.movies[index],));
            },
          )),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme;

    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress){
                  if( loadingProgress != null){
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return GestureDetector(
                    onTap: () => context.push('/movie/${ movie.id }'),
                    child: FadeIn(child: child)); 
                }
              ),
            ),
          ),

          const SizedBox(height: 5),

          //Texto- titutlo
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: titleStyle.titleSmall,
            ),
          ),

          //Rating - star
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon ( Icons.star_half_outlined, color: Colors.yellow.shade900),
                const SizedBox(width: 3),
                Text(
                  '${movie.voteAverage}', 
                  style: titleStyle.bodyMedium?.copyWith(color: Colors.yellow.shade900),
                ),
                const Spacer(),
                //Text('${movie.popularity}', style: titleStyle.bodySmall,)
                Text(HumanFormats.number(movie.popularity), style: titleStyle.bodyMedium,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final subTitleStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      padding: const EdgeInsets.only(top: 12),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle! , style: subTitleStyle,))
        ],
      ),
    );
  }
}
