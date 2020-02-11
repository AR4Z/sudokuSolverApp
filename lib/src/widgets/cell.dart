import 'package:flutter/material.dart';

class Cell extends StatefulWidget {
  final int number;
  final bool selected;
  final refresh_selected;
  Cell({Key key, this.number, this.selected, this.refresh_selected}) : super(key: key);

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  bool selectedLikeTofill = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            color: widget.selected ? Colors.grey : Colors.white),
        child: Center(
          child: Text(
            '${widget.number}',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
      onTap: () {
        this.setState(() {
          widget.refresh_selected();
          //this._selectedCell = Tuple2<int, int>(x, y);
        });
      },
    );
  }
}
