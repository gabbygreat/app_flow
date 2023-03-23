import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final testProvider = StateProvider<bool>((ref) => false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App flow')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shortcut',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                final test = ref.watch(testProvider);
                return test
                    ? const Divider(
                        thickness: 2,
                        color: Colors.black,
                      )
                    : TextField(
                        decoration: const InputDecoration(
                          hintText: 'Type here',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.startsWith('—')) {
                            ref.read(testProvider.notifier).state = true;
                          }
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
