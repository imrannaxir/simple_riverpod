import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpod/providers.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counterProvider);
            },
            icon: const Icon(
              Icons.refresh,
              size: 32,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          ref.watch(counterProvider).toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: myFloatingActionButton(ref),
    );
  }

  Widget myFloatingActionButton(ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          heroTag: 'Increment',
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state--;
          },
          heroTag: 'Decrement',
          child: const Icon(
            Icons.remove,
            size: 32,
          ),
        ),
      ],
    );
  }
}
