import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String value;

  const CardWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.red, width: 20.0),
              color: Colors.red,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white, width: 0.0),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Center(child: Text(value.toString(),style: const TextStyle(fontSize: 210),)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/images/icon_$value.jpg'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
