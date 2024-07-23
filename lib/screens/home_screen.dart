import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final counter = ref.read(counterProvider);
    
    print('Construcción de home screen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screnn'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, _) {
                final counter = ref.watch(counterProvider).counter;
                return Text('$counter');
              }
            ),
          ),
          const SizedBox(),
          const Text('Presiona el boton para aumentar el valor')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,

        child: const Icon(Icons.add),
      ),
    );
  }
}

final counterProvider = ChangeNotifierProvider((ref) => Counter());

class Counter extends ChangeNotifier {

  int counter = 0;

  increment() {

    counter++;
    notifyListeners();

  }

}