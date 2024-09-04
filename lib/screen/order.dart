import 'package:flutter/material.dart';
import 'dart:math';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Map<String, dynamic>> combinedOrders = []; 
  final Set<int> usedNumbers = {};
  final Random random = Random();

  int generateRandomOrderNumber() {
    int newOrderNumber;
    do {
      newOrderNumber = random.nextInt(100) + 1;
    } while (usedNumbers.contains(newOrderNumber));
    usedNumbers.add(newOrderNumber);
    return newOrderNumber;
  }

  void addTakeOutOrder() {
    setState(() {
      combinedOrders.add({
        'orderNumber': generateRandomOrderNumber(),
        'type': 'Take-Out',
      });
    });
  }

  void addDineInOrder() {
    setState(() {
      combinedOrders.add({
        'orderNumber': generateRandomOrderNumber(),
        'type': 'Dine-In',
      });
    });
  }

  void submitOrders() {
    if (combinedOrders.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pesanan Berhasil Dikirim'),
            content: Text(
                'Pesanan sudah dikirim ke dapur. Anda bisa melihatnya di layar dapur.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); 
                  Navigator.pop(context,
                      combinedOrders);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tidak ada pesanan untuk dikirim ke dapur.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Kasir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addTakeOutOrder,
                  child: Text('Tambah Pesanan Take-Out'),
                ),
                ElevatedButton(
                  onPressed: addDineInOrder,
                  child: Text('Tambah Pesanan Dine-In'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: combinedOrders.map((order) {
                  return Text(
                    'Pesanan ${order['type']}: ${order['orderNumber']}',
                    style: TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: submitOrders,
              child: Text('Kirim ke Dapur'),
            ),
          ],
        ),
      ),
    );
  }
}
