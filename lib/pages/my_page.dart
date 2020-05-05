//

import 'package:flutter/material.dart';
import 'package:tutorial/pages/aboutme.dart';
import 'package:tutorial/views/problems_view.dart';
import 'package:tutorial/views/settings.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('个人中心'),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.settings,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                }),
          ],
        ),

        body: AboutMe(),
        drawer: new Drawer(
          child: HomeBuilder.homeDrawer(),
        ),
    );
  }

}


class HomeBuilder {
  static Widget homeDrawer() {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      _drawerHeader(),
      new ClipRect(
        child: new ListTile(
          leading: new CircleAvatar(child: new Text("A")),
          title: new Text('Drawer item A'),
          subtitle: new Text("还能写点啥"),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Text("B")),
        title: new Text('Drawer item B'),
        subtitle: new Text("就这？"),
        onTap: () => {},
      ),
      new AboutListTile(
        icon: new CircleAvatar(child: new Text("Ab")),
        child: new Text("About"),
        applicationName: "Test",
        applicationVersion: "1.0",
        applicationIcon: new Image.asset(
          "",
          width: 64.0,
          height: 64.0,
        ),
        applicationLegalese: "applicationLegalese",
        aboutBoxChildren: <Widget>[
          new Text("BoxChildren"),
          new Text("box child 2")
        ],
      ),
    ]);
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "我就是试一下",
      ),
      accountEmail: new Text(
        "xxx@163.com",
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage(""), //头像
      ),
      onDetailsPressed: () {}, //展示更多
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage(""),
        ),
      ],
    );
  }
}

class Goods {
  String imageUrl;

  Goods(this.imageUrl);
}