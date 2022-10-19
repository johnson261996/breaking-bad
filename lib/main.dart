
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:breaking_bad/screens/character_screen.dart';
import 'package:breaking_bad/screens/death_screen.dart';
import 'package:breaking_bad/screens/episode_screen.dart';
import 'package:breaking_bad/screens/quote_screen.dart';
import 'package:breaking_bad/widget/Shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data = await PlatformAssetBundle().load('assets/encrypt/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Breaking Bad'),
          backgroundColor: Colors.cyan,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon:  Icon(Icons.person),),
              Tab(icon:  Icon(Icons.video_file),),
              Tab(icon:  Icon(Icons.format_quote),),
              Tab(icon:  Icon(Icons.dangerous),)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CharacterScreen(),
            EpisodeScreen(),
            QuoteScreen(),
            DeathScreen()
          ],
        ),
        ),
      );
  }


}



