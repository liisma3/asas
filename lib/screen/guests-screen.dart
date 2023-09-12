import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Guests extends StatefulWidget {
  const Guests({super.key});

  @override
  State<Guests> createState() => _GuestsState();
}

class _GuestsState extends State<Guests> {
  List guests = [];
  String _query = """
query {
   viewers {
    _id
    email
    login
    loginSlug
  }
}""";
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(_query),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const CircularProgressIndicator();
          }
          guests = result.data!["viewers"];

          return ListView.builder(
            itemCount: guests.length,
            itemBuilder: (context, index) {
              final guest = guests[index];
              print({guest});
              return Stack(children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 23, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            color: Colors.grey.shade300,
                            blurRadius: 30),
                      ]),
                  padding: const EdgeInsets.all(30),
                  child: InkWell(
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${guest["email"]}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.contact_emergency)
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              ]);
            },
          );
        });
  }
}
