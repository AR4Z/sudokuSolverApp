import 'package:flutter/material.dart';
import 'package:sudoku_solver/src/pages/home_page.dart';
import 'package:sudoku_solver/src/pages/sudoku_page.dart';

void main() => runApp(SudokuSolver());

class SudokuSolver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sudoku solver',
        initialRoute: 'sudoku',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (BuildContext context) => HomePage(),
          'sudoku': (BuildContext context) => SudokuPage()
        });
  }
}
