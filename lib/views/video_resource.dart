import 'package:flutter/material.dart';
import 'package:tutorial/models/order_list_row.dart';

class VideoRecommend extends StatefulWidget {
  @override
  _VideoRecommendState createState() => _VideoRecommendState();
}

class _VideoRecommendState extends State<VideoRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),
        child: ListView(
          children: <Widget>[
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '图论',
            ),
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '形式语言与自动机',
            ),
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '关系',
            ),
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '集合论',
            ),
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '命题逻辑',
            ),
            OrderListRow(1,
              lessonNum: '23847563928174',
              lessonName: '一阶逻辑',
            ),
          ],
        ),
      ),
    );
  }
}
