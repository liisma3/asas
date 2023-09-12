import 'package:asas/screen/add_guest.dart';
import 'package:asas/screen/guests-screen.dart';
import 'package:flutter/material.dart';

class AsasScreen extends StatefulWidget {
  const AsasScreen({Key? key}) : super(key: key);

  @override
  State<AsasScreen> createState() => _AsasScreenState();
}

class _AsasScreenState extends State<AsasScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Guests();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('1asas',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              )),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: content,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final route =
              MaterialPageRoute(builder: (content) => const AddGuest());
          await Navigator.push(context, route);
        },
        backgroundColor: Colors.lightGreen[300],
        child: const Icon(Icons.group_add_outlined),
      ),
    );
  }
}
