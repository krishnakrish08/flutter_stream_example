import 'package:flutter/material.dart';

class StreamCounterScreen extends StatelessWidget {
  const StreamCounterScreen({super.key});

  Stream<int> counterStream() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                'Counter: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}
