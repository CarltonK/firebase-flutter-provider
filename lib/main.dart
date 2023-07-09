import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lengaqu_test/firebase_options.dart';
import 'package:lengaqu_test/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IssueProvider()),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<IssueProvider>(
          builder: (context, issueProvider, _) {
            if (issueProvider.isLoading) {
              // Loading state, show loading indicator or skeleton screen
              return const Center(child: CircularProgressIndicator());
            } else if (issueProvider.issues.isEmpty) {
              // Empty state, display a message or an empty list widget
              return const Center(child: Text('No issues found.'));
            } else {
              // Loaded state, display the list of issues
              return ListView.builder(
                itemCount: issueProvider.issues.length,
                itemBuilder: (context, index) {
                  final issue = issueProvider.issues[index];
                  return ListTile(
                    title: Text(
                      issue.title!,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      issue.description!,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
