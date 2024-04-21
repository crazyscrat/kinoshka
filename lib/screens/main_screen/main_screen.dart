import 'package:flutter/material.dart';
import 'package:kinoshka/library/widgets/inherited/model_providers.dart';
import 'package:kinoshka/screens/main_screen/main_screen_model.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text.dart';
import 'package:kinoshka/settings/app_text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainScreenModel _model;

  @override
  void initState() {
    super.initState();
    _model = MainScreenModel();
    _loadDataModel();
  }

  void _loadDataModel() async{
    await _model.getTop250(page: 1);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            AppText.title,
            style: AppTextStyle.title,
          ),
        ),
        leading: const Icon(Icons.menu, color: AppIconStyle.appBarIconColor),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search_rounded,
              color: AppIconStyle.appBarIconColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.login,
              color: AppIconStyle.appBarIconColor,
            ),
          )
        ],
      ),
      body: NotifierModelProvider(
          model: _model, child: const _Top250WidgetList()),
    );
  }
}

class _Top250WidgetList extends StatefulWidget {
  const _Top250WidgetList();

  @override
  State<_Top250WidgetList> createState() => _Top250WidgetListState();
}

class _Top250WidgetListState extends State<_Top250WidgetList> {
  @override
  Widget build(BuildContext context) {
    final model = NotifierModelProvider.watch<MainScreenModel>(context);

    if(model?.top250 == null) return Container();

    return ListView.builder(
      itemCount: model?.top250.length,
      itemBuilder: (context, index) {
        if(index == (model!.top250.length - 2)){
          model.getNextPageTop250();
        }

        return _MovieListWidget(
          index: index,
        );
      },
    );
  }
}

class _MovieListWidget extends StatelessWidget {
  final int index;

  const _MovieListWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = NotifierModelProvider.read<MainScreenModel>(context);
    final item = model?.top250[index];

    String countries = '';
    if(item?.countries != null) {
      int length = item?.countries?.length as int;
      for (var i = 0; i < length; i++) {
        countries += item!.countries![i];
        if(i + 1 < length) {
          countries += ', ';
        }
      }
    }

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
              Text(
                item?.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.movieName,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 128,
                    child: Image.network(
                      item?.poster?.previewUrl ?? '',
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      },
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item?.shortDescription ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Icon(Icons.language_outlined, size: AppIconStyle.countryIconSize, color: AppIconStyle.countryIconColor),
                              Text(countries, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              const SizedBox(width: 8),
                              const Icon(Icons.calendar_month, size: AppIconStyle.countryIconSize, color: AppIconStyle.countryIconColor),
                              Text(item?.year.toString() ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              const SizedBox(width: 8),
                              const Icon(Icons.access_time, size: AppIconStyle.countryIconSize, color: AppIconStyle.countryIconColor),
                              Text(item?.movieLength.toString() ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.star, size: AppIconStyle.ratingStarSize, color: AppIconStyle.ratingStarColor),
                  Text(
                    'КП ${item?.rating?.kp.toString() ?? ''}',
                    style: AppTextStyle.rating,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, size: AppIconStyle.ratingStarSize, color: AppIconStyle.ratingStarColor),
                  Text(
                    'IMDB ${item?.rating?.imdb.toString() ?? ''}',
                    style: AppTextStyle.rating,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, size: AppIconStyle.ratingStarSize, color: AppIconStyle.ratingStarColor),
                  Text(
                    'FC ${item?.rating?.filmCritics.toString() ?? ''}',
                    style: AppTextStyle.rating,
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, size: AppIconStyle.ratingStarSize, color: AppIconStyle.ratingStarColor),
                  Text(
                    'RFC ${item?.rating?.russianFilmCritics?.toStringAsFixed(2).toString() ?? ''}',
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
              onTap: () => model?.selectMovie(context, index),
            ),
          ),
        )
      ],
    );
  }
}
