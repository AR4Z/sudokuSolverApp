import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_solver/src/pages/scan_sudoku_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku solver'),
        actions: <Widget>[],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () async {
                final cameras = await availableCameras();

                // Obtén una cámara específica de la lista de cámaras disponibles
                final firstCamera = cameras.first;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScanSudoku(camera: firstCamera)));
              },
              child: Text(
                "Scan Sudoku",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
