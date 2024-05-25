import 'package:flutter/material.dart';
import 'package:kinoshka/screens/movie_screen/movie_details_screen_model.dart';
import 'package:kinoshka/screens/movie_screen/movie_details_widget.dart';
import 'package:kinoshka/settings/app_icon_style.dart';
import 'package:kinoshka/settings/app_text_style.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read<MovieDetailsScreenModel>().setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const _TitleWidget(),
        iconTheme: const IconThemeData(color: AppIconStyle.appBarIconColor),
      ),
      body: MovieDetailsWidget(),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final title =  context.watch<MovieDetailsScreenModel>().movieDetails?.title ?? 'Загрузка...';

    return Center(
      child: Text(
        title,
        style: AppTextStyle.title,
      ),
    );
  }
}




