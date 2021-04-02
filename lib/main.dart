import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color targetColor;
  Color yellow = Colors.yellow;
  Color green = Colors.green;
  Color blue = Colors.blue;

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dragable'),
          actions: [
            Icon(Icons.exit_to_app),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Widget Drag dengan data color
                colorPicker(green),
                colorPicker(blue),
                colorPicker(yellow)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Widget Drag dengan data color
                colorPicker(Colors.amber),
                colorPicker(Colors.red),
                colorPicker(Colors.purple)
              ],
            ),
            DragTarget(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  isAccepted = true;
                  targetColor = value;
                },
                builder: (context, candidate, rejected) {
                  return (isAccepted)
                      ? SizedBox(
                          width: 250,
                          height: 250,
                          child: Material(
                            shape: StadiumBorder(),
                            color: targetColor,
                          ),
                        )
                      : SizedBox(
                          width: 250,
                          height: 250,
                          child: Material(
                            shape: StadiumBorder(),
                            color: Colors.red,
                          ));
                })
          ],
        ),
      ),
    );
  }

  Draggable<Color> colorPicker(Color warna) {
    return Draggable<Color>(
      // data yang akan dikirim
      data: warna,
      child: SizedBox(
        width: 100,
        height: 100,
        // child utama
        child: Material(
          shape: StadiumBorder(),
          color: warna,
        ),
      ),
      // widget asal tempat widget saat di drag
      childWhenDragging: SizedBox(
        width: 100,
        height: 100,
        child: Material(
          shape: StadiumBorder(),
          color: Colors.grey,
        ),
      ),

      // widget yang sedang didrag
      feedback: SizedBox(
        width: 100,
        height: 100,
        child: Material(
          shape: StadiumBorder(),
          // warna dengan transparansi 70%
          color: warna.withOpacity(0.7),
        ),
      ),
    );
  }
}
