import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kinoshka/entity/person_in_movie.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';
import 'package:kinoshka/library/widgets/inherited/model_providers.dart';
import 'package:kinoshka/screens/movie_screen/movie_screen_model.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text.dart';
import 'package:kinoshka/settings/app_text_style.dart';

class MovieScreen extends StatefulWidget {
  final SearchMovieDtoV14 movie;

  const MovieScreen({super.key, required this.movie});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late final MovieScreenModel _model;

  @override
  void initState() {
    super.initState();
    _model = MovieScreenModel(widget.movie);
    _loadDataModel();
  }

  void _loadDataModel() async{
    await _model.loadInfoById();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final title = _model.movie.name ?? AppText.title;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            title,
            style: AppTextStyle.title,
          ),
        ),
        iconTheme: const IconThemeData(color: AppIconStyle.appBarIconColor),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.login,
              color: AppIconStyle.appBarIconColor,
            ),
          )
        ],
      ),
      body: NotifierModelProvider(model: _model, child: _MovieWidget()),
    );
  }
}

class _MovieWidget extends StatelessWidget {
  _MovieWidget();

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final model = NotifierModelProvider.watch<MovieScreenModel>(context);

    if( model?.movieFullInfo.id == 0) return Container();

    final movie = model?.movieFullInfo;

    final String releaseYears = movie!.releaseYears?.toString() ?? '';
    final String alternativeName = movie.alternativeName ?? '';

    String genres = model?.getGenres() ?? '';
    String countries = model?.getCountries() ?? '';
    String type = model?.getType() ?? '';

    List<Widget> facts = <Widget>[];
    if (movie.facts!.isNotEmpty) {
      facts.add(const Text('Факты: '));

      movie.facts?.forEach((element) {
        facts.add(const _DividerWidget(color: Colors.black12));
        facts.add(Html(data: '${model?.getNextFact()?.value}'));
        //facts.add(Text('${model?.getNextFact()?.value}'));
      });

      facts.add(const _DividerWidget(color: Colors.grey));
    }

    int? actorsCount = movie.persons?.where((element) => element.enProfession == 'actor').length;
    //int? actorsCount = movie.persons?.length;
    if (actorsCount != null && actorsCount % 2 != 0) {
      actorsCount -= 1;
    }

    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Image.network(movie.poster?.previewUrl ?? '',
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RowWidget(
                    title: 'Оригинальное название: ', text: alternativeName),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(title: 'Тип: ', text: type),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(
                  title: 'Жанр: ',
                  text: genres,
                ),
                const _DividerWidget(color: Colors.grey),
                const Text('Рейтинги: '),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'Кинопоиск: ',
                    text: movie.rating?.kp.toString() ?? ''),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'IMDB: ', text: movie.rating?.imdb.toString() ?? ''),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'Film Critics: ',
                    text: movie.rating?.filmCritics.toString() ?? ''),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'Russian Film Critics: ',
                    text: movie.rating?.russianFilmCritics.toString() ?? ''),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(text: movie.year.toString(), title: 'Премьера: '),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(title: 'Страна: ', text: countries),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(title: 'Повторы: ', text: releaseYears),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(
                    title: 'Возрастной рейтинг: ',
                    text: '${movie.ageRating.toString()}+'),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(
                    title: 'Продолжительность: ',
                    text: '${movie.movieLength.toString()} минут'),
                const _DividerWidget(color: Colors.grey),
                Text(movie.description.toString()),
                const _DividerWidget(color: Colors.grey),
                _RowWidget(
                    title: 'Бюджет: ',
                    text: '${movie.budget?.value} ${movie.budget?.currency}'),
                const _DividerWidget(color: Colors.grey),
                const Text('Сборы: '),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'В мире: ',
                    text:
                        '${movie.fees?.world?.value} ${movie.fees?.world?.currency}'),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'В России: ',
                    text:
                        '${movie.fees?.russia?.value} ${movie.fees?.russia?.currency}'),
                const _DividerWidget(color: Colors.black12),
                _RowWidget(
                    title: 'В США: ',
                    text:
                        '${movie.fees?.usa?.value} ${movie.fees?.usa?.currency}'),
                const _DividerWidget(color: Colors.grey),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: facts),
                //const _DividerWidget(color: Colors.grey),
                const Text('Актерский состав: '),
                const _DividerWidget(color: Colors.black12),
                ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model?.getPersonsCont(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            _ActorWidget(person: model?.getNextPerson()),
                            const SizedBox(width: 16),
                            _ActorWidget(person: model?.getNextPerson()),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActorWidget extends StatelessWidget {
  const _ActorWidget({
    required this.person,
  });

  final PersonInMovie? person;

  @override
  Widget build(BuildContext context) {
    //if(person?.id == 0) return Container();

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            border: const Border.symmetric(
                vertical: BorderSide(color: Colors.black12),
                horizontal: BorderSide(color: Colors.black12)),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 9 / 13,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network(person?.photo ?? ''),
              ),
            ),
            Text(person?.name ?? ''),
            Text(person?.description ?? ''),
          ],
        ),
      ),
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
