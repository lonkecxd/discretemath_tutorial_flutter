import 'package:flutter/material.dart';
import 'package:tutorial/views/settings.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(
          Icons.dehaze,
        ),
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
      body: Column(
        children: <Widget>[
          stack,
          new ListTile(
            leading:new Icon(
              Icons.timeline,
              color: Colors.blue,
            ),
            title:new Text('学习时长：20h',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          new ListTile(
            leading:new Icon(
              Icons.question_answer,
              color: Colors.blue,
            ),
            title:new Text('累计答题：520题',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          new ListTile(
            leading:new Icon(
              Icons.book,
              color: Colors.blue,
            ),
            title:new Text('掌握知识点：100个',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      )
    );
  }

  Widget stack = new Stack(
    alignment: AlignmentDirectional.center,
    children: <Widget>[
      Image.asset(
        'assets/bg.jpeg',
        height: 240.0,
        fit: BoxFit.cover,
      ),
      CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage(
            'assets/emoji.png'
        ),
      ),
      Positioned(
        bottom: 20,
        child: Text(
            '昵称',
            style: TextStyle(
              fontSize: 20,
              color: Colors.amberAccent
            ),
        ),
      )
    ],
  );


}
