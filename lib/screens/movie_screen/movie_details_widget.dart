import 'package:flutter/material.dart';
import 'package:kinoshka/domain/api_client/image_downloader.dart';
import 'package:kinoshka/entity/actor.dart';
import 'package:kinoshka/screens/movie_screen/movie_details_screen_model.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text_style.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatelessWidget {
  MovieDetailsWidget({super.key});
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieDetailsScreenModel>();

    if (model.movieDetails == null) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.grey,
      ));
    }

    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const _TitleWidget(),
          const _PlayTrailerWidget(),
          _ActorsWidget(controller: controller),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _TaglineWidget extends StatelessWidget {
  const _TaglineWidget();

  @override
  Widget build(BuildContext context) {
    final tagline = context.read<MovieDetailsScreenModel>()
        .movieDetails
        ?.tagline;

    if (tagline == null || tagline.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        _RowWidget(title: 'Слоган: ', text: tagline),
        const _DividerWidget(color: Colors.grey),
      ],
    );
  }
}

class _RowWidget extends StatelessWidget {
  const _RowWidget({
    required this.title,
    required this.text,
  });

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(title)),
        Expanded(flex: 3, child: Text(text)),
      ],
    );
  }
}

class _DividerWidget extends StatelessWidget {
  final Color color;

  const _DividerWidget({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(height: 2, color: color),
    );
  }
}

class _ActorWidget extends StatelessWidget {
  const _ActorWidget({
    required this.actor,
  });

  final Actor? actor;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieDetailsScreenModel>();

    model.loadActorImages(actor!.id);
    if (!model.mapActorImages.containsKey(actor?.id)) {
      return const SizedBox.shrink();
    }

    final profile = model.mapActorImages[actor?.id]?.profiles[0];

    return Row(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              border: const Border.symmetric(
                  vertical: BorderSide(color: Colors.black12),
                  horizontal: BorderSide(color: Colors.black12)),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 9 / 13,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                    ImageDownloader.imageUrl(profile?.filePath ?? ''),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actor?.name ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              //Text(actor?.description ?? ''),
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _PlayTrailerWidget extends StatelessWidget {
  const _PlayTrailerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsScreenModel>();

    final movieDetails = model.movieDetails;
    final String originalTitle = movieDetails?.originalTitle ?? '';

    String genres = model.getGenres();
    String countries = model.getCountries();

    String voteAverage = (movieDetails!.voteAverage * 10).toStringAsFixed(1);
    int hours = movieDetails.runtime! ~/ 60;
    int minutes = movieDetails.runtime! % 60;
    String runtime = '$hours ч ${minutes.toString().padLeft(2, '0')} мин';

    final videos = movieDetails.videos?.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    String? trailerKey;
    if (videos != null && videos.isNotEmpty) {
      final videosHD = videos.where((video) => video.size == 1080);
      if (videosHD.isNotEmpty) {
        trailerKey = videosHD.first.key;
      } else {
        trailerKey = videos.isNotEmpty ? videos.first.key : null;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          trailerKey != null
              ? Column(
            children: [
              TextButton(
                  onPressed: () =>
                      model.openTrailerScreen(context, trailerKey!),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Text(
                        'Play trailer',
                        style: AppTextStyle.playTrailerText,
                      ),
                    ],
                  )),
              const _DividerWidget(color: Colors.grey),
            ],
          )
              : const SizedBox.shrink(),
          Text(movieDetails.overview.toString()),
          const _DividerWidget(color: Colors.grey),
          _RowWidget(
              title: 'Оригинальное название: ', text: originalTitle),
          const _DividerWidget(color: Colors.grey),
          const _TaglineWidget(),
          _RowWidget(
            title: 'Жанр: ',
            text: genres,
          ),
          const _DividerWidget(color: Colors.grey),
          _RowWidget(title: 'Рейтинг IMDB: ', text: '$voteAverage %'),
          const _DividerWidget(color: Colors.grey),
          _RowWidget(
              text: model.stringFromDate(movieDetails.releaseDate),
              title: 'Премьера: '),
          const _DividerWidget(color: Colors.grey),
          _RowWidget(title: 'Страна: ', text: countries),
          const _DividerWidget(color: Colors.grey),
          // _RowWidget(
          //     title: 'Возрастной рейтинг: ',
          //     text: '${movieDetails.adult.toString()}+'),
          // const _DividerWidget(color: Colors.grey),
          _RowWidget(title: 'Время: ', text: runtime),
          const _DividerWidget(color: Colors.grey),
          _RowWidget(
              title: 'Бюджет: ', text: '\$ ${movieDetails.budget}'),
          const _DividerWidget(color: Colors.grey),
          const Text('Актерский состав: '),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsScreenModel>();
    final movieDetails = model.movieDetails!;

    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          Image.network(ImageDownloader.imageUrl(movieDetails.backdropPath!),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }),
          Positioned(
            left: 24,
            top: 24,
            child: Container(
              width: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Image.network(
                  ImageDownloader.imageUrl(movieDetails.posterPath!),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: model.isFavorite ? const Icon(
                Icons.favorite,
                color: AppIconStyle.favoriteIconColor,
              ) :
              const Icon(
                Icons.favorite_border,
                color: AppIconStyle.favoriteIconColor,
              ),
              onPressed: () => model.toggleFavorite(context),
            ),
          )
        ],
      ),
    );
  }
}

class _ActorsWidget extends StatelessWidget {
  final ScrollController controller;
  const _ActorsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieDetailsScreenModel>();
    final movieDetails = model.movieDetails!;

    List<Actor>? actors;
    if (movieDetails.credits!.actors.length > 10) {
      actors = movieDetails.credits!.actors.sublist(0, 10);
    } else {
      actors = movieDetails.credits!.actors;
    }

    return actors.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
      height: 220,
      child: ListView.builder(
        itemExtent: 136,
        controller: controller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: actors.length,
        itemBuilder: (BuildContext context, int index) {
          return _ActorWidget(actor: actors?[index]);
        },
      ),
    );
  }
}
