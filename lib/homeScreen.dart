import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: const Color(0xff000000),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: new AssetImage(
                  'assets/ss.png',
                ),
              ),
            ),
          ),
          Positioned(
            top: 530,
            left: 50,
            right: 50,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buttons(Icon(Icons.play_arrow), () {
                  Navigator.of(context).pushNamed('/play');
                }, "Play"),
                buttons(Icon(Icons.share), () {
                  Share.share(
                      "Plase Share This App with your Friends & Family! https://www.instagram.com/__yaasshuhh__/");
                }, "Share ")
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ],
      ),
    );
  }

  Widget buttons(var icons, var func, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: icons,
          iconSize: 90,
          color: Colors.grey,
          onPressed: func,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
