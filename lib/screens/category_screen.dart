import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    //final Map<String, String> routeArgs = ModalRoute.of(context)!.settings.arguments;
   final string = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = string['title'] ;
    final categoryId = string['id'];

    final categoryData = DUMMY_CATEGORIES.where((data) {
      return data.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  icon: Image.asset(
                    'assets/images/previous.png',
                    width: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$categoryTitle",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 0,
            thickness: 3,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CategoryItem(
                  id: categoryData[index].id,
                  title: categoryData[index].title,
                  imageUrl: categoryData[index].imageUrl,
                  ingredients: categoryData[index].ingredients,
                  steps: categoryData[index].steps,
                  duration: categoryData[index].duration,
                  complexity: categoryData[index].complexity,
                  isVisible: categoryData[index].isVisible,
                );
              },
              itemCount: categoryData.length,
            ),
          )
        ],
      ),
    );
  }
}
