import 'package:flutter/material.dart';

import '../../widgets/ContactTile.dart';

class GridList extends StatelessWidget {
  const GridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 20,
                //   mainAxisSpacing: 100,
                //   childAspectRatio: 1.3,
                // ),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 50,
                childAspectRatio: 1 / 1.5,
                children: [
                  Contact(
                    name: "Adarsh",
                    profession: "Coder",
                    city: "Chennai",
                    rating: "4.5",
                  ),
                  Contact(
                    name: "Aditya",
                    profession: "Coder",
                    city: "Mumbai",
                    rating: "5",
                  ),
                  Contact(
                    name: "Param",
                    profession: "Student",
                    city: "Chennai",
                    rating: "4",
                  ),
                  Contact(
                    name: "Tejas",
                    profession: "Developer",
                    city: "Pune",
                    rating: "5",
                  ),
                  Contact(),
                  Contact(),
                  Contact(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
