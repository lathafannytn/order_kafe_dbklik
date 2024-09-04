import 'package:flutter/material.dart';
import 'order.dart';
import 'kitchen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> combinedOrders = [];

  void updateOrders(List<Map<String, dynamic>> orders) {
    setState(() {
      combinedOrders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Kasir Cafe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(),
                  ),
                );
                if (result != null) {
                  updateOrders(result);
                }
              },
              child: Text('Buat Pesanan Baru'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KitchenScreen(
                      combinedOrders: combinedOrders,
                    ),
                  ),
                );
              },
              child: Text('Lihat Dapur'),
            ),
          ],
        ),
      ),
    );
  }
}
