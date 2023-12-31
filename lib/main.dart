import 'package:flutter/material.dart';
import 'package:asas/screen/asas_screen.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  //await Firebase.initializeApp();
  final HttpLink link = HttpLink('http://localhost:3003/api');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore())));
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
            title: '1asas',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: theme,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black87),
              ),
            ),
            home: const AsasScreen()),
      ),
    );
  }
}
