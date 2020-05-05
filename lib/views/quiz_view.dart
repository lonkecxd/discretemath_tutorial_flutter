import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/models/data.dart';
import 'package:tutorial/views/backdrop.dart';
import 'package:tutorial/views/problem_panel.dart';
import 'package:tutorial/views/problems_list.dart';
// 答题界面入口
class QuizView extends StatefulWidget {

  final String heading;

  QuizView({this.heading});

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {

    String _currentProblemId = '0000';//TODO hardcode
    Problem _curProblem;

    void _onCategoryTap(String problemId) {
      DummyDataService.curProblem = DummyDataService.tempProblems!=null?DummyDataService.tempProblems.where((p) => p.id.contains(problemId)).toList()[0]:null;
      setState(() {
        _currentProblemId = problemId;
        _curProblem = DummyDataService.curProblem;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Backdrop(
        currentCategory: _currentProblemId,
        title: widget.heading,
        frontLayer: QuizProblemCQ(
          problemId: _currentProblemId,
        ),
        backLayer: ProblemsList(
          currentProblemId: _currentProblemId,
          onCategoryTap: _onCategoryTap,
          chapter: widget.heading,
        ),
        //Container(),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      );
  }
}

