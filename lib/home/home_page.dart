//
//  home_page.dart
//  zego-express-example-topics-flutter
//
//  Created by Patrick Fu on 2020/11/12.
//  Copyright © 2020 Zego. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/zego_config.dart';
import '../topics/play_stream/play_stream_login_page.dart';
import '../topics/publish_stream/publish_stream_login_page.dart';
import '../topics/quick_start/quick_start_page.dart';
import '../topics/video_talk/video_talk_page.dart';
import 'global_setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load config
    ZegoConfig.instance.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ZegoExpressExample'),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return GlobalSettingPage();
                  }));
                })
          ],
        ),
        body: SafeArea(
            child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            TopicWidget('Quick Start', QuickStartPage(), context),
            TopicWidget('Publish Stream', PublishStreamLoginPage(), context),
            TopicWidget('Play Stream', PlayStreamLoginPage(), context),
            TopicWidget('VideoTalk', VideoTalkPage(), context),
          ]).toList(),
        )));
  }
}

class TopicWidget extends ListTile {
  late Widget targetPage;
  late BuildContext context;

  TopicWidget(String title, Widget targetPage, BuildContext context)
      : super(
          title: Text(title),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            if (ZegoConfig.instance.appID > 0 &&
                ZegoConfig.instance.appSign.isNotEmpty) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return targetPage;
              }));
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Tips'),
                      content: Text(
                          'Please set up AppID and other necessary configuration first'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return GlobalSettingPage();
                            }));
                          },
                        )
                      ],
                    );
                  });
            }
          },
        );
}
