import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:game2048/homeScreen.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    _bannerAd..show();
    super.initState();
  }

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '2048',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Stack(
        children: [
          HomeScreen(),
        ],
      )),
      routes: <String, WidgetBuilder>{
        '/play': (BuildContext context) => new HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
