import 'package:flutter/material.dart';

class FindProfile extends StatefulWidget {
  const FindProfile({super.key});

  @override
  State<FindProfile> createState() => _FindProfileState();
}

class _FindProfileState extends State<FindProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Profile')),

    );
  }
}
