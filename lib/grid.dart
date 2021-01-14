import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      shrinkWrap: false,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
                
              ),
              boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 4,
                spreadRadius: -4)
          ],
              color: Theme.of(context).primaryColorLight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://www.einfochips.com/blog/wp-content/uploads/2018/11/how-to-develop-machine-learning-applications-for-business-banner.jpg'
                          ),
                          fit: BoxFit.fitHeight
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 3),
                              blurRadius: 4,
                              spreadRadius: -4)
                        ]),
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Machine Learning: The Great Stagnation",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 40)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                        "Academics think of themselves as trailblazers, explorers - seekers of the truth. Any fundamental discovery involves a significant degree of risk. If an idea is guaranteed to work then it moves from the realm of research... ",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12K Likes   140 Shares",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20)),
                      Icon(
                        Icons.api,
                        color: Theme.of(context).accentColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
