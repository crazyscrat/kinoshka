import 'package:flutter/material.dart';
import 'package:kinoshka/domain/api_client/image_downloader.dart';
import 'package:kinoshka/screens/movie_list_Widget/movie_top_list_view_model.dart';
import 'package:kinoshka/settings/app_colors.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text_style.dart';
import 'package:provider/provider.dart';

class MoviesTopListWidget extends StatefulWidget {
  const MoviesTopListWidget({super.key});

  @override
  State<MoviesTopListWidget> createState() => _MoviesTopListWidgetState();
}

class _MoviesTopListWidgetState extends State<MoviesTopListWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieTopListViewModel>().setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _TopListViewWidget(),
        _SearchWidget()
      ],
    );
  }
}

class _TopListViewWidget extends StatelessWidget {
  const _TopListViewWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieTopListViewModel>();
    if (model.movies.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 60),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: model.movies.length,
      itemBuilder: (context, index) {
        model.showedMovieAtIndex(index);
        return _MovieListWidget(
          index: index,
        );
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieTopListViewModel>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: AppColors.textFieldCursor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelText: 'Поиск',
            filled: true,
            fillColor: AppColors.textFieldFillColor,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                  width: 1,
                )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                  width: 1,
                ))),
        onChanged: model.searchMovies,
      ),
    );
  }
}

class _MovieListWidget extends StatelessWidget {
  final int index;

  const _MovieListWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MovieTopListViewModel>();
    final movie = model.movies[index];
    final posterPath = movie.posterPath;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 95,
                    child: posterPath != null
                        ? Image.network(
                      ImageDownloader.imageUrl(posterPath),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      },
                      fit: BoxFit.contain,
                    )
                        : const Placeholder(),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyle.movieName,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                size: AppIconStyle.countryIconSize,
                                color: AppIconStyle.countryIconColor),
                            const SizedBox(width: 4),
                            Text(movie.releaseDate,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          movie.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.star,
                      size: AppIconStyle.ratingStarSize,
                      color: AppIconStyle.ratingStarColor),
                  Text(
                    'IMDB ${movie.voteAverage.toString()}',
                    style: AppTextStyle.rating,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => model.selectMovie(context, index),
            ),
          ),
        )
      ],
    );
  }
}