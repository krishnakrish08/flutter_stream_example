import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamBuilderWithAPI extends StatelessWidget {
  const StreamBuilderWithAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const JokeScreen();
  }
}

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  Stream<String> jokeStream() async* {
    while (true) {
      final response = await http
          .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
      if (response.statusCode == 200) {
        final joke = json.decode(response.body);
        yield "${joke['setup']} - ${joke['punchline']}";
      } else {
        yield "Failed to load joke";
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Jokes'),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: jokeStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                snapshot.data ?? 'No joke available',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              );
            }
          },
        ),
      ),
    );
  }
}
