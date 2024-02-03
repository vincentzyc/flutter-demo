import 'package:flutter/material.dart';

class DivideLine extends StatefulWidget {
  final double mmargin;

  const DivideLine({super.key, required this.mmargin});

  @override
  State<StatefulWidget> createState() {
    return DivideLineView();
  }
}

class DivideLineView extends State<DivideLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.5,
      margin: EdgeInsets.only(left: widget.mmargin, right: widget.mmargin),
      color: Colors.grey[400],
    );
  }
}
