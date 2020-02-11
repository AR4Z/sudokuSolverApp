import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sudoku_solver/src/pages/scan_sudoku_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> emptyCells = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku solver'),
        actions: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          Text('Seleccione las celdas vacías'),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 9,
            children: List.generate(81, (index) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      color: this.emptyCells.contains(index)
                          ? Colors.blue
                          : Colors.white),
                  child: Center(
                    child: Text(
                      '',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ),
                onTap: () {
                  this.setState(() {
                    if (emptyCells.contains(index)) {
                      emptyCells.remove(index);
                    } else {
                      emptyCells.add(index);
                    }
                  });
                },
              );
            }),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () async {
                    if (emptyCells.length == 0) {
                      print('sw');
                      Fluttertoast.showToast(
                          msg: "Por favor seleccione una o más celdas vacías",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1);
                    } else {
                      final cameras = await availableCameras();

                      // Obtén una cámara específica de la lista de cámaras disponibles
                      final firstCamera = cameras.first;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScanSudoku(camera: firstCamera)));
                    }
                  },
                  child: Text(
                    "Scan Sudoku",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
