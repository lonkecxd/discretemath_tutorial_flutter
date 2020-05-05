import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/models/data.dart';
import 'package:tutorial/views/problem_panel.dart';

//第一个视图,列表
class CuoTi extends StatefulWidget {
  @override
  _CuoTiState createState() => _CuoTiState();
}

class _CuoTiState extends State<CuoTi> {

   List<Map<String, dynamic>> _wrongProblems;

  initState() {
    _getData();
  }

  Future _getData() async{
    _wrongProblems = await DummyDataService.getWrongProblems();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //设置显示个数
      itemCount:_wrongProblems.length ,
      //设置显示内容的相应，参数是匿名函数
      //itemBuilder: (context,index){},  //两个参数，一个是上下文，一个就是列表的索引
      itemBuilder: (context,index){
        //ListTile()组件，创建列表中的元素
        return ListTile(
          title: Text(_wrongProblems[index]['P'].properties.pid),
          // onTap: (){}, 点击事件，参数为匿名函数，类似于RaisedButton onPressed
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return QuizProblemCQ(
                    problemId: _wrongProblems[index]['P'].properties.pid,
                  );
                }
            )
            );
          },
        );
      },
    );
  }
}

