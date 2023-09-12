import 'package:flutter/material.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({super.key});

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: ListTile(title: Text("MonWidget"))),
    );
  }
}
