import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/category_screen.dart';

class DashboardItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  DashboardItem(this.id, this.title, this.description, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageUrl,
              width: 56,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              title,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 11,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
