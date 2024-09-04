import 'package:flutter/material.dart';
import 'screen/dashboard.dart';

void main() {
  runApp(CafeCashierApp());
}

class CafeCashierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Cashier',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: DashboardScreen(),
    );
  }
}
