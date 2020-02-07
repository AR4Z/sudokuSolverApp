import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class SudokuPage extends StatefulWidget {
  @override
  _SudokuPageState createState() => _SudokuPageState();
}

class _SudokuPageState extends State<SudokuPage> {
  List<List<int>> _sudokuGrid;
  Tuple2<int, int> _selectedCell = Tuple2<int, int>(0, 0);

  @override
  void initState() {
    super.initState();
    _sudokuGrid = [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku solver'),
        actions: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 9,
            children: List.generate(81, (index) {
              int x, y = 0;
              x = (index / 9).floor();
              y = (index % 9);

              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      color: this._selectedCell.item1 == x &&
                              this._selectedCell.item2 == y
                          ? Colors.grey
                          : Colors.white),
                  child: Center(
                    child: Text(
                      '${this._sudokuGrid[x][y]}',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ),
                onTap: () {
                  this.setState(() {
                    this._selectedCell = Tuple2<int, int>(x, y);
                  });
                },
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 9,
            children: List.generate(9, (index) {
              return InkWell(
                child: Container(
                  child: Center(
                    child: Text(
                      '${index % 10 + 1}',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                ),
                onTap: () {
                  this.setState(() {
                    this._sudokuGrid[this._selectedCell.item1]
                        [this._selectedCell.item2] = index % 10 + 1;
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
                  child: Text("Solve sudoku", style: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    print('solve');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
