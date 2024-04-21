import 'package:kinoshka/entity/collection_list.dart';
import 'package:kinoshka/entity/currency_value.dart';
import 'package:kinoshka/entity/fact_in_movie.dart';
import 'package:kinoshka/entity/linked_movie_V14.dart';
import 'package:kinoshka/entity/movie_dto_v14.dart';
import 'package:kinoshka/entity/person_in_movie.dart';
import 'package:kinoshka/entity/premiere.dart';
import 'package:kinoshka/entity/production_company.dart';
import 'package:kinoshka/entity/rating.dart';
import 'package:kinoshka/entity/search_movie_dto_v1_4.dart';
import 'package:kinoshka/entity/url_info.dart';
import 'package:kinoshka/entity/video.dart';

abstract class Tests {
  // static final Docs docs = Docs(
  //     films: categories, total: 90, limit: 10, page: 1, pages: 90
  // );

  static final List<SearchMovieDtoV14> top250 = [
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.823,
          imdb: 8.5,
          filmCritics: 6.8,
          russianFilmCritics: 100,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/bGksau9GGu0uJ8DJQ8DYc9JW5LM.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/bGksau9GGu0uJ8DJQ8DYc9JW5LM.jpg"),
      movieLength: 112,
      id: 535341,
      type: "movie",
      name: '1+1',
      description:
          "Пострадав в результате несчастного случая, богатый аристократ Филипп нанимает в помощники человека, который менее всего подходит для этой работы, – молодого жителя предместья Дрисса, только что освободившегося из тюрьмы. Несмотря на то, что Филипп прикован к инвалидному креслу, Дриссу удается привнести в размеренную жизнь аристократа дух приключений.",
      year: 2011,
      poster: UrlInfo(
          url:
              'https://image.openmoviedb.com/kinopoisk-images/1946459/bf93b465-1189-4155-9dd1-cb9fb5cb1bb5/orig',
          previewUrl:
              'https://image.openmoviedb.com/kinopoisk-images/1946459/bf93b465-1189-4155-9dd1-cb9fb5cb1bb5/x1000'),
      genres: ["драма", "комедия", "биография"],
      countries: ["Франция"],
      typeNumber: 1,
      shortDescription:
          "Аристократ на коляске нанимает в сиделки бывшего заключенного. Искрометная французская комедия с Омаром Си",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/1531675/2a0000017f0262661cde61dc260cb86f7830/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.567,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/tintsaQ0WLzZsTMkTiqtMB3rfc8.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/tintsaQ0WLzZsTMkTiqtMB3rfc8.jpg"),
      movieLength: 113,
      id: 1143242,
      type: "movie",
      name: 'Джентльмены',
      description:
          "Один ушлый американец ещё со студенческих лет приторговывал наркотиками, а теперь придумал схему нелегального обогащения с использованием поместий обедневшей английской аристократии и очень неплохо на этом разбогател. Другой пронырливый журналист приходит к Рэю, правой руке американца, и предлагает тому купить киносценарий, в котором подробно описаны преступления его босса при участии других представителей лондонского криминального мира — партнёра-еврея, китайской диаспоры, чернокожих спортсменов и даже русского олигарха.",
      year: 2019,
      poster: UrlInfo(
          url:
              'https://image.openmoviedb.com/kinopoisk-images/1599028/637271d5-61b4-4e46-ac83-6d07494c7645/orig',
          previewUrl:
              'https://image.openmoviedb.com/kinopoisk-images/1599028/637271d5-61b4-4e46-ac83-6d07494c7645/x1000'),
      genres: ["криминал", "комедия", "боевик"],
      countries: ["США", "Великобритания"],
      typeNumber: 1,
      shortDescription:
          "Наркобарон хочет уйти на покой, но криминальный мир не отпускает. Успешное возвращение Гая Ричи к корням",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/1534341/2a00000176f18064fd95abb74cbcc02873b8/orig"
      ],
      alternativeName: "The Gentlemen",
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/2P0toWq3feNvFAzf28j7vNc1IuZ.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/2P0toWq3feNvFAzf28j7vNc1IuZ.jpg"),
      movieLength: 180,
      id: 462682,
      type: "movie",
      name: 'Волк с Уолл-стрит',
      description:
          "1987 год. Джордан Белфорт становится брокером в успешном инвестиционном банке. Вскоре банк закрывается после внезапного обвала индекса Доу-Джонса. По совету жены Терезы Джордан устраивается в небольшое заведение, занимающееся мелкими акциями. Его настойчивый стиль общения с клиентами и врождённая харизма быстро даёт свои плоды. Он знакомится с соседом по дому Донни, торговцем, который сразу находит общий язык с Джорданом и решает открыть с ним собственную фирму. В качестве сотрудников они нанимают нескольких друзей Белфорта, его отца Макса и называют компанию «Стрэттон Оукмонт». В свободное от работы время Джордан прожигает жизнь: лавирует от одной вечеринки к другой, вступает в сексуальные отношения с проститутками, употребляет множество наркотических препаратов, в том числе кокаин и кваалюд. Однажды наступает момент, когда быстрым обогащением Белфорта начинает интересоваться агент ФБР...",
      year: 2013,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/1946459/5c758ac0-7a5c-4f00-a94f-1be680a312fb/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/1946459/5c758ac0-7a5c-4f00-a94f-1be680a312fb/x1000"),
      genres: ["драма", "криминал", "комедия", "биография"],
      countries: ["США"],
      typeNumber: 1,
      shortDescription:
          "Восхождение циника-гедониста на бизнес-олимп 1980-х. Блистательный тандем Леонардо ДиКаприо и Мартина Скорсезе",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/1534341/2a00000178c64fe43f3b567acaaa73e861f0/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/cRQq2VXKP9Vt9NHLXoHailKVhrW.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/cRQq2VXKP9Vt9NHLXoHailKVhrW.jpg"),
      movieLength: 100,
      id: 41519,
      type: "movie",
      name: 'Брат',
      description:
          "Демобилизовавшись, Данила Багров вернулся в родной городок. Но скучная жизнь российской провинции не устраивала его, и он решился податься в Петербург, где, по слухам, уже несколько лет процветает его старший брат. Данила нашел брата. Но все оказалось не так просто — брат работает наемным убийцей.",
      year: 1997,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/1704946/e9008e2f-433f-43b0-b9b8-2ea8e3fb6c9b/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/1704946/e9008e2f-433f-43b0-b9b8-2ea8e3fb6c9b/x1000"),
      genres: ["драма", "криминал", "боевик"],
      countries: ["Россия"],
      typeNumber: 1,
      shortDescription:
          "Дембель Данила Багров защищает слабых в Петербурге 1990-х. Фильм, сделавший Сергея Бодрова народным героем",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/2439731/2a0000017c61da4f185f94d808f4d90182a8/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/6uLhSLXzB1ooJ3522ydrBZ2Hh0W.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/6uLhSLXzB1ooJ3522ydrBZ2Hh0W.jpg"),
      movieLength: 103,
      id: 8124,
      type: "movie",
      name: 'Один дома',
      description:
          "Американское семейство отправляется из Чикаго в Европу, но в спешке сборов бестолковые родители забывают дома... одного из своих детей. Юное создание, однако, не теряется и демонстрирует чудеса изобретательности. И когда в дом залезают грабители, им приходится не раз пожалеть о встрече с милым крошкой.",
      year: 1990,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/6201401/022a58e3-5b9b-411b-bfb3-09fedb700401/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/6201401/022a58e3-5b9b-411b-bfb3-09fedb700401/x1000"),
      genres: ["комедия", "семейный"],
      countries: ["США"],
      typeNumber: 1,
      shortDescription:
          "Мальчик-озорник задает жару грабителям. Лучшая комедия для создания праздничного настроения у всей семьи",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/212840/2a00000172550ce8255397b4e3d6f9938ddf/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/vL5LR6WdxWPjLPFRLe133jXWsh5.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/vL5LR6WdxWPjLPFRLe133jXWsh5.jpg"),
      movieLength: 162,
      id: 251733,
      type: "movie",
      name: 'Аватар',
      description:
          "Бывший морпех Джейк Салли прикован к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса.",
      year: 2009,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/1599028/4adf61aa-3cb7-4381-9245-523971e5b4c8/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/1599028/4adf61aa-3cb7-4381-9245-523971e5b4c8/x1000"),
      genres: ["фантастика", "боевик", "драма", "приключения"],
      countries: ["США"],
      typeNumber: 1,
      shortDescription:
          "Парализованный морпех становится мессией для жителей Пандоры. Самый кассовый фильм в истории кино",
      ageRating: 12,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/2385704/2a00000176f1bb64212c9df414a8909c8f44/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/4HWAQu28e2yaWrtupFPGFkdNU7V.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/4HWAQu28e2yaWrtupFPGFkdNU7V.jpg"),
      movieLength: 130,
      id: 1188529,
      type: "movie",
      name: 'Достать ножи',
      description:
          "На следующее утро после празднования 85-летия известного автора криминальных романов Харлана Тромби виновника торжества находят мёртвым. Налицо — явное самоубийство, но полиция по протоколу опрашивает всех присутствующих в особняке членов семьи, хотя, в этом деле больше заинтересован частный детектив Бенуа Блан. Тем же утром он получил конверт с наличными от неизвестного и заказ на расследование смерти Харлана. Не нужно быть опытным следователем, чтобы понять, что все приукрашивают свои отношения с почившим главой семейства, но Блану достаётся настоящий подарок — медсестра покойного, которая физически не выносит ложь.",
      year: 2019,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/1777765/bb8afbd6-c9cd-4631-99e9-3fecf241dbaf/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/1777765/bb8afbd6-c9cd-4631-99e9-3fecf241dbaf/x1000"),
      genres: ["детектив", "комедия", "драма", "криминал"],
      countries: ["США"],
      typeNumber: 1,
      shortDescription:
          "Частный детектив ведет запутанное дело о смерти известного писателя. Криминальная комедия с Дэниэлом Крэйгом",
      ageRating: 18,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/2385704/2a00000176f1bb64212c9df414a8909c8f44/orig"
      ],
    ),
    SearchMovieDtoV14(
      rating: Rating(
          kp: 8.011,
          imdb: 7.8,
          filmCritics: 6.5,
          russianFilmCritics: 85.7143,
          await: null),
      backdrop: UrlInfo(
          url:
              "https://image.openmoviedb.com/tmdb-images/original/z8125Gm4hadwQZOcFiZ7uor77E4.jpg",
          previewUrl:
              "https://image.openmoviedb.com/tmdb-images/w500/z8125Gm4hadwQZOcFiZ7uor77E4.jpg"),
      movieLength: 88,
      id: 42664,
      type: "movie",
      name: 'Иван Васильевич меняет профессию',
      description:
          "Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далёким шестнадцатым веком — точнее, с палатами государя Ивана Грозного. Туда-то и попадают тёзка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский, а сам великий государь оказывается в квартире Тимофеева.",
      year: 1973,
      poster: UrlInfo(
          url:
              "https://image.openmoviedb.com/kinopoisk-images/6201401/a7ef44b8-1983-4992-a889-da6f87a3f559/orig",
          previewUrl:
              "https://image.openmoviedb.com/kinopoisk-images/6201401/a7ef44b8-1983-4992-a889-da6f87a3f559/x1000"),
      genres: ["комедия", "фантастика", "приключения"],
      countries: ["СССР"],
      typeNumber: 1,
      shortDescription:
          "Иван Грозный отвечает на телефон, пока его тезка-пенсионер сидит на троне. Советский хит о липовом государе",
      ageRating: 6,
      logo: [
        "https://avatars.mds.yandex.net/get-ott/2439731/2a000001720d0315b85f00ffcf4f8472e93a/orig"
      ],
    ),
  ];

  static final List<MovieDtoV14> listFullInfo = [
    MovieDtoV14(
        rating: Rating(
            kp: 8.567,
            imdb: 7.8,
            filmCritics: 6.5,
            russianFilmCritics: 85.7143,
            await: null),
        backdrop: UrlInfo(
            url:
                "https://image.openmoviedb.com/tmdb-images/original/tintsaQ0WLzZsTMkTiqtMB3rfc8.jpg",
            previewUrl:
                "https://image.openmoviedb.com/tmdb-images/w500/tintsaQ0WLzZsTMkTiqtMB3rfc8.jpg"),
        movieLength: 113,
        id: 1143242,
        type: "movie",
        name: 'Джентльмены',
        description:
            "Один ушлый американец ещё со студенческих лет приторговывал наркотиками, а теперь придумал схему нелегального обогащения с использованием поместий обедневшей английской аристократии и очень неплохо на этом разбогател. Другой пронырливый журналист приходит к Рэю, правой руке американца, и предлагает тому купить киносценарий, в котором подробно описаны преступления его босса при участии других представителей лондонского криминального мира — партнёра-еврея, китайской диаспоры, чернокожих спортсменов и даже русского олигарха.",
        year: 2019,
        poster: UrlInfo(
            url:
                'https://image.openmoviedb.com/kinopoisk-images/1599028/637271d5-61b4-4e46-ac83-6d07494c7645/orig',
            previewUrl:
                'https://image.openmoviedb.com/kinopoisk-images/1599028/637271d5-61b4-4e46-ac83-6d07494c7645/x1000'),
        genres: ["криминал", "комедия", "боевик"],
        countries: ["США", "Великобритания"],
        typeNumber: 1,
        shortDescription:
            "Наркобарон хочет уйти на покой, но криминальный мир не отпускает. Успешное возвращение Гая Ричи к корням",
        ageRating: 18,
        logo: [
          "https://avatars.mds.yandex.net/get-ott/1534341/2a00000176f18064fd95abb74cbcc02873b8/orig"
        ],
        alternativeName: "The Gentlemen",
        fees: Fees(
            world: CurrencyValue(
        value: 115171795,
        currency: "\$"
            ),
            russia: CurrencyValue(
        value: 18003343,
        currency: "\$"
            ),
            usa: CurrencyValue(
        value: 36471795,
        currency: "\$"
            )
        ),
        productionCompanies: [
          ProductionCompany(
              name: "Miramax",
              url:
                  "https://www.themoviedb.org/t/p/original/m6AHu84oZQxvq7n1rsvMNJIAsMu.png",
              previewUrl:
                  "https://www.themoviedb.org/t/p/w500/m6AHu84oZQxvq7n1rsvMNJIAsMu.png"),
          ProductionCompany(name: "STX Films", url: null, previewUrl: null),
          ProductionCompany(
              name: "Toff Guy Films", url: null, previewUrl: null),
          ProductionCompany(name: "Leonine", url: null, previewUrl: null),
        ],
        premiere: Premiere(
            world: "2019-12-03T00:00:00.000Z",
            russia: "2020-02-13T00:00:00.000Z",
            digital: "2020-03-31T00:00:00.000Z"),
        slogan: "Criminal. Class",
        budget: CurrencyValue(value: 22000000, currency: '\$'),
        facts: [
          FactInMovie(
              value:
                  "Хью Грант и Чарли Ханнэм снимали свои сцены в течение 5 дней, и за это время произнесли более 40 страниц диалогов.",
              type: "FACT",
              spoiler: false),
          FactInMovie(
              value:
                  "Когда Майкл возвращается в паб, снаружи зритель видит фургончик с надписью Gritchie Brewery. Пивоваренной компанией с таким названием владеет режиссёр фильма Гай Ричи.",
              type: "FACT",
              spoiler: false),
          FactInMovie(
              value:
                  "Хью Грант и Мэттью МакКонахи ни разу не встретились на съемочной площадке.",
              type: "FACT",
              spoiler: false),
        ],
        persons: [
          PersonInMovie(
              id: 797,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_797.jpg",
              name: "Мэттью Макконахи",
              enName: "Matthew McConaughey",
              description: "Michael Pearson",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 38702,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_38702.jpg",
              name: "Чарли Ханнэм",
              enName: "Charlie Hunnam",
              description: "Ray",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 4950097,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_4950097.jpg",
              name: "Генри Голдинг",
              enName: "Henry Golding",
              description: "Dry Eye",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 8090,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_8090.jpg",
              name: "Хью Грант",
              enName: "Hugh Grant",
              description: "Fletcher",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 1067193,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_1067193.jpg",
              name: "Мишель Докери",
              enName: "Michelle Dockery",
              description: "Rosalind Pearson",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 1146480,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_1146480.jpg",
              name: "Джереми Стронг",
              enName: "Jeremy Strong",
              description: "Matthew",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 2444,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_2444.jpg",
              name: "Эдди Марсан",
              enName: "Eddie Marsan",
              description: "Big Dave",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 2454111,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_2454111.jpg",
              name: "Джейсон Вонг",
              enName: "Jason Wong",
              description: "Phuc",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 373,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_373.jpg",
              name: "Колин Фаррелл",
              enName: "Colin Farrell",
              description: "Coach",
              profession: "актеры",
              enProfession: "actor"),
          PersonInMovie(
              id: 1006787,
              photo:
                  "https://st.kp.yandex.net/images/actor_iphone/iphone360_1006787.jpg",
              name: "Лин Рене",
              enName: "Lyne Renée",
              description: "Jackie",
              profession: "актеры",
              enProfession: "actor"),
        ],
        lists: [
          "top500",
          "top250",
          "popular-films",
          "hd-blockbusters",
          "hd-revise",
          "ozvucheno_kubik_v_kube",
          "box-russia-dollar",
          "hearing_impairment",
          "top20of2023",
          "hd"
        ],
        similarMovies: [
          LinkedMovieV14(
              id: 526,
              name: "Большой куш",
              enName: null,
              alternativeName: "Snatch",
              type: "movie",
              poster: UrlInfo(
                  url:
                      "https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/47fe48f6-ff17-4411-a12f-d337bea2639d/orig",
                  previewUrl:
                      "https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/47fe48f6-ff17-4411-a12f-d337bea2639d/x1000"),
              year: 2000,
              rating: Rating(
                  kp: 8.552,
                  imdb: 8.2,
                  filmCritics: 6.4,
                  russianFilmCritics: 100,
                  await: null)),
          LinkedMovieV14(
              id: 522,
              name: "Карты, деньги, два ствола",
              enName: null,
              alternativeName: "Lock, Stock and Two Smoking Barrels",
              type: "movie",
              poster: UrlInfo(
          url: "https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/6492653f-11d5-4087-a1d2-ec7a74f161d3/orig",
          previewUrl: "https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/6492653f-11d5-4087-a1d2-ec7a74f161d3/x1000"
              ),
              year: 1998,
              rating: Rating(
                kp: 8.558,
                imdb: 8.1,
                filmCritics: 6.7,
                russianFilmCritics: 0,
                await: null
              )
          ),
        ],
      videos: VideoTypes(
        trailers: [
          Video(
              url: "https://www.youtube.com/embed/e-aiHVdRlJg",
              name: "ДЖЕНТЛЬМЕНЫ | Трейлер #2 | В кино с 13 февраля",
              site: "youtube",
              type: "TRAILER"
          ),
          Video(
              url: "https://www.youtube.com/embed/Fui5_1tTuac",
              name: "ДЖЕНТЛЬМЕНЫ | Трейлер | В кино с 13 февраля",
              site: "youtube",
              type: "TRAILER"
          ),
          Video(
              url: "https://www.youtube.com/embed/e-aiHVdRlJg",
              name: "ДЖЕНТЛЬМЕНЫ | Трейлер #2 | В кино с 13 февраля",
              site: "youtube",
              type: "TRAILER"
          ),
          Video(
              url: "https://www.youtube.com/embed/Fui5_1tTuac",
              name: "ДЖЕНТЛЬМЕНЫ | Трейлер | В кино с 13 февраля",
              site: "youtube",
              type: "TRAILER"),
          Video(
              url: "https://www.youtube.com/embed/KlXsguV9g0E",
              name: "The Gentlemen | Official Trailer 2 [HD] | In Theaters January 24, 2020",
              site: "youtube",
              type: "TRAILER"
          ),
        ]
      )
    ),
  ];
}
