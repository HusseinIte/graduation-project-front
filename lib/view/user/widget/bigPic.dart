import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class bigPic extends StatelessWidget {
  const bigPic({super.key});

  @override
  Widget build(BuildContext context) {


  //if you don't want widget full screen then use center widget

  // ignore: unused_element
  Widget customBackgroundColor() => FullScreenWidget(
     disposeLevel: DisposeLevel.Medium,
        backgroundColor: Colors.purple,
        child: Center(
          child: Hero(
            tag: "customBackground",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/image3.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget nonTransparentWidget() => FullScreenWidget(
        backgroundColor: Colors.purple,
        backgroundIsTransparent: false,
        disposeLevel: DisposeLevel.Medium,
        child: Center(
          child: Hero(
            tag: "nonTransparent",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/image3.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget customWidget(  Widget widget) => FullScreenWidget(
     disposeLevel: DisposeLevel.Medium,
        child: SafeArea(
          child: Card(
            elevation: 4,
            child: Container(
              height: 350,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: "customWidget",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: widget,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Lorem text',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Expanded(
                    child: Text(
                      "lorem",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    return Container();
  }
}