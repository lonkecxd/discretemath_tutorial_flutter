import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tutorial/views/quiz_view.dart';

const cardTextColor =  Color.fromARGB(255, 22, 209, 233);

class QuizCategory extends StatefulWidget {
  @override
  _QuizCategoryState createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<QuizCategory> {

  _onMyItemPressed(heading){
    Navigator.push(context,new  MaterialPageRoute(
        builder:(context) =>new QuizView(
              heading: heading,
        ))
    );
  }

  Material MyItems(IconData icon, String heading){
    return Material(
      color: Theme.of(context).cardColor,
      elevation: 2.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: ()=>_onMyItemPressed(heading),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon
                  icon != null ? Material(
                    borderRadius: BorderRadius.circular(24.0),
                    color:  Color(0xff445f7b),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        size: 30.0,
                      ),
                    ),
                  ): Container(),
                  //Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading, style: Theme.of(context).textTheme.headline2),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      children: [
        MyItems(null,  "命题集合"),
        MyItems(Icons.graphic_eq ,"图论1"),
        MyItems(Icons.graphic_eq ,"图论2"),
        MyItems(Icons.graphic_eq ,"图论3"),
        MyItems(Icons.graphic_eq ,"图论4"),
      ],
      staggeredTiles: [
        StaggeredTile.extent(1, 90),
        StaggeredTile.extent(1, 180),
        StaggeredTile.extent(1, 180),
        StaggeredTile.extent(1, 180),
        StaggeredTile.extent(1, 180),
      ],
    );
  }
}
