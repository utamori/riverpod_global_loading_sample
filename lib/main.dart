import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_global_loading_sample/example_page.dart';
import 'package:riverpod_global_loading_sample/loading.dart';

part 'main.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(globalLoadingServiceProvider);

    return MaterialApp(
      home: const HomePage(),
      builder: (context, child) {
        return PopScope(
          canPop: !isLoading,
          child: Stack(
            children: [
              if (child case final child?) child,

              // Indicator.
              if (isLoading)
                const ColoredBox(
                  color: Colors.black54,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () async {
              /// ExamplePageをpush
              await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ExamplePage()));
            },
            child: const Text('push page1'),
          ),
        ]),
      ),
    );
  }
}
