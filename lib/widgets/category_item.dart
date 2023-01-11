import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final int duration;
  final bool isVisible;

  CategoryItem({
    @required this.id='',
    @required this.title='',
    @required this.imageUrl='',
    required this.ingredients,
    required this.steps,
    required this.complexity,
    @required this.duration=0,
    required this.isVisible,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Beginner:
        return 'Beginner';
        break;
      case Complexity.Intermediate:
        return 'Intermediate';
        break;
      case Complexity.Advanced:
        return 'Advanced';
        break;
      case Complexity.Quiz:
        return 'Quiz';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'ingredients': ingredients,
        'steps': steps,
        'complexity': complexityText,
        'duration': duration,
        'isVisible': isVisible,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectDetail(context),
      child: Card(
        color: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: Container(
                    width: 240,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.assignment,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
