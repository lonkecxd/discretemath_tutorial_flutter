import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/tools/RgbaColor.dart';

class OrderListRow extends StatelessWidget {
  final int lessonStatus;
  final String lessonName;///课程名称
  final String lessonNum;///课程编号
  final Function onPress;


  OrderListRow(this.lessonStatus, {
    this.lessonName,
    this.lessonNum,
    this.onPress
  });


  /// 文字状态
  Widget textStatus() {
    var text = '';
    var color =  Color.fromARGB(255, 22, 209, 233);
    if(lessonStatus == 1) {
      color = rgba(136, 175, 213, 1);
      text = "去学习";
    }
    else if(lessonStatus == 2) text = "已学习";
    else if(lessonStatus == 3) text = "已取消";

    return Text(text, style: TextStyle(
        fontSize: 15,
        color: color
    ));
  }

  /// 按钮状态
  List<Widget> buttonStatus(BuildContext context) {
    List<Widget>button = [];

    var btn1 = Container(
      margin: EdgeInsets.only(left: 10),

    );

    var btn2 = Container(
      margin: EdgeInsets.only(left: 10),

    );

    var btn3 = Container(
      margin: EdgeInsets.only(left: 10),

    );

    if(lessonStatus == 1) {
      button.add(btn2);
    } else if(lessonStatus == 2) {
      button.add(btn1);
      button.add(btn3);
    } else if(lessonStatus == 3) {
      button.add(btn1);
    }
    return button;

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      child: InkWell(
        onTap: () => onPress == null ? (){} : onPress(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 160,
            color: Theme.of(context).cardColor.withOpacity(0.2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    //border: G.borderBottom()
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('课程编号：$lessonNum', style: TextStyle(
                          color:Color.fromARGB(255, 22, 209, 233),
                          fontSize: 12
                      ),
                      ),
                      textStatus()
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('$lessonName', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('课程简介:........',style: TextStyle(
                          fontSize: 15,
                          color:Color.fromARGB(255, 22, 209, 233)
                      ),)
                    ],
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
