import 'package:bank_manager/main_view/home_view.dart';
import 'package:bank_manager/service/api_firebase.dart';
import 'package:bank_manager/service/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BankManagerData>>.value(
      value: API(documentId: 'documentId').data,
      initialData: const [],
      child: Scaffold(
          appBar: AppBar(
              title: const Text("BankManager"),
              backgroundColor: Colors.blueGrey.shade900),
          body: const SingleChildScrollView(child: HomeView()),
          backgroundColor: Colors.blueGrey.shade900),
    );
  }
}
