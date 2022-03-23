import 'dart:io';
import 'package:coolmovies/config/routes/routes.dart';
import 'package:coolmovies/modules/screens/movies.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cool Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        home: const MoviesPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final ValueNotifier<Map<String,dynamic>?> _data = ValueNotifier(null);
  //int _counter = 0;

  // void _fetchData() async {
  //   print('Fetching data...');
  //   var client = GraphQLProvider.of(context).value;

  //   final QueryResult result = await client.query(
  //     QueryOptions(
  //       document: gql(r"""
  //         query AllMovies {
  //           allMovies {
  //             nodes {
  //               id
  //               imgUrl
  //               movieDirectorId
  //               userCreatorId
  //               title
  //               releaseDate
  //               nodeId
  //               userByUserCreatorId {
  //                 id
  //                 name
  //                 nodeId
  //               }
  //             }
  //           }
  //         }
  //       """),
  //     )
  //   );

  //   if (result.hasException) {
  //     print(result.exception.toString());
  //   }

  //   if(result.data != null) {
  //     _data.value = result.data!['allMovies'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    """Thank you for taking the time to take our test. We really appreciate it.
All the information on what is required can be found in the README at the root of this repo.
Please dont spend ages on this and just get through as much of it as you can.
Good luck! :)""",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
