import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/models/data.dart';
// 答题界面抽屉：展示所有题目
class ProblemsList extends StatefulWidget {
  final String currentProblemId;
  final ValueChanged<String> onCategoryTap;
  final String chapter;
  ProblemsList({
    Key key,
    @required this.currentProblemId,
    @required this.onCategoryTap,
    this.chapter,
  })  : assert(currentProblemId != null),
        assert(onCategoryTap != null);

  @override
  _ProblemsListState createState() => _ProblemsListState();
}

class _ProblemsListState extends State<ProblemsList> {

  List<Problem> _problems;
  bool openSubCate = false;

  initState() {
    _getData(widget.chapter);
  }

  Future _getData(String problemId) async{
    _problems = await DummyDataService.getProblemListByChapter(widget.chapter);
    DummyDataService.curProblemId = _problems[0].id;
    widget.onCategoryTap(_problems[0].id);
    setState(() {
      _problems = _problems;
    });
  }

  Widget _buildCategory(Problem problem, BuildContext context) {
    String problemId = problem.id;
    String description = problem.description;
    final problemString = problemId; //TODO 展示题目关键词
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => widget.onCategoryTap(problemId),
      child: widget.currentProblemId == problemId
          ? Material(
            child: ListTile(
              title: Text(
                problemString,
                style: theme.textTheme.bodyText1.copyWith(fontSize: 18,
                color: Theme.of(context).accentColor),
                textAlign: TextAlign.center,
              ),
            ),
          )
          : Material(
            child: Opacity(
              opacity: 0.5,
              child: Container(
               color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: ListTile(
                  focusColor: Theme.of(context).primaryColor,
                  title: Text(
                    problemString,
                    style: theme.textTheme.bodyText1.copyWith(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(gradient: LinearGradient(colors:[Colors.greenAccent, Colors.lightBlueAccent])),
        child: ListView(
        children: _problems!=null?_problems
            .map((Problem p) => _buildCategory(p, context))
            .toList():[]),
    ),
    );
  }
}