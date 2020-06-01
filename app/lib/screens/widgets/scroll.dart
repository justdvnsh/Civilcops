import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {

  Widget child;

  Scroll({@required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
       builder: (BuildContext context, BoxConstraints viewportConstraints) {
         return SingleChildScrollView(
           child: ConstrainedBox(
             constraints: BoxConstraints(
               minHeight: viewportConstraints.maxHeight,
             ),
             child: IntrinsicHeight(
               child: this.child,
             )
           ),
         );
      }
    );
  }
}