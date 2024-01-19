import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_global_loading_sample/loading.dart';

import 'remote_info.dart';

class ExamplePage extends ConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalName = ref.watch(remoteStringProvider);
    final country = ref.watch(remoteAddressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Example 1')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () async {
              ref.read(globalLoadingServiceProvider.notifier).wrap(
                    Future.delayed(const Duration(seconds: 3)),
                  );
            },
            child: const Text('wait 3 second'),
          ),
          ElevatedButton(
            onPressed: () async {
              ref.invalidate(remoteStringProvider);
            },
            child: Text(animalName.value ?? 'reload animal name'),
          ),
          ElevatedButton(
            onPressed: () async {
              ref.invalidate(remoteAddressProvider);
            },
            child: Text(country.value ?? 'reload country name'),
          ),
        ],
      )),
    );
  }
}
