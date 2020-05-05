import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        child: Column(
          children: <Widget>[
            ListTile(
              title: new Text(
                '消息中心', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('查看您的最近通知'),
              leading: new Icon(Icons.message, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: new Text(
                '个人资料', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('查看自己的个人资料信息'),
              leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: new Text(
                '学习兴趣', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('选择自己感兴趣的学习'),
              leading: new Icon(Icons.check, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: new Text(
                '设置', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('关于app的设置'),
              leading: new Icon(Icons.settings, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: new Text(
                '意见反馈', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('提供您对app的意见信息'),
              leading: new Icon(Icons.share, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: new Text(
                '给智能导学app评价', style: TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('提供您的使用感受'),
              leading: new Icon(Icons.link, color: Colors.lightBlue,),
            ),
            new Divider(),
            ListTile(
              title: Center(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: new Text(
                    '注销', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.redAccent),),
                ),
              ),
            ),
            new Divider(),
          ],
        ),

      ),
    );
  }
}