import 'package:flutter/material.dart';
import 'package:flutter_live_counter_stream_example/stream_builder_with_api.dart';
import 'package:flutter_live_counter_stream_example/stream_counter_screen.dart';

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StreamCounterScreen(),
                  ),
                );
              },
              child: const Text('Live Counter'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const JokeScreen(),
                  ),
                );
              },
              child: const Text('API'),
            )
          ],
        ),
      ),
    );
  }
}
