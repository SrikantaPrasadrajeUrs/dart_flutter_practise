import 'package:flutter/material.dart';


class ChannelPage extends StatelessWidget {
  final String channelName;
  final String imageUrl;
  const ChannelPage({super.key, required this.channelName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(channelName),
        centerTitle: true,
      ),
      body: Image.network(imageUrl),
    );
  }
}

///
/// white text
/// image should rounder corner
/// it should fioll entire width with little padding on top and left right
