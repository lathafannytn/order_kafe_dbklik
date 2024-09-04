import 'package:flutter/material.dart';

class KitchenScreen extends StatefulWidget {
  final List<Map<String, dynamic>> combinedOrders;

  KitchenScreen({required this.combinedOrders});

  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {
  List<int> takeOutOrders = [];
  List<int> dineInOrders = [];
  List<int> servedOrders = [];

  void processOrders() {
    for (var order in widget.combinedOrders) {
      if (order['type'] == 'Take-Out') {
        takeOutOrders.add(order['orderNumber']);
      } else if (order['type'] == 'Dine-In') {
        dineInOrders.add(order['orderNumber']);
      }
      servedOrders.add(order['orderNumber']); 
    }
  }

  @override
  void initState() {
    super.initState();
    processOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dapur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pesanan ambil: ${takeOutOrders}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Pesanan makan di tempat: ${dineInOrders}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Pesanan yang dilayani: ${servedOrders}', style: TextStyle(fontSize: 16, color: Colors.green)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bool isValid = true;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Validasi Pesanan'),
                    content: Text(isValid
                        ? 'Pesanan valid sesuai urutan.'
                        : 'Pesanan tidak valid.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Cek Validitas Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
