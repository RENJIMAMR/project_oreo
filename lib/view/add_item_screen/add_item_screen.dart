// lib/view/add_item_screen.dart

import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

import 'package:project_oreo/view/scanning_screen/scanning_screen.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String barcodeResult = "Scan a barcode"; // Default message for the result

  @override
  void initState() {
    super.initState();
    // Automatically call the barcode scanner when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scanBarcode();
    });
  }

  // Method to scan barcode
  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan(); // Start the barcode scanner
      setState(() {
        barcodeResult = result.rawContent; // Store the result in state
      });

      // Navigate to the next screen after a successful scan
      if (barcodeResult.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanningScreen(barcode: barcodeResult),
          ),
        );
        print(barcodeResult);
      }
    } catch (e) {
      setState(() {
        barcodeResult = "Failed to scan barcode: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              barcodeResult,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
