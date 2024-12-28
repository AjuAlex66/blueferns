import 'package:blueferns_taskaju/presentation/screens/filterpage.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Helper.push(const FilterPage()),
            child: const Text("Filter Options")),
      ),
    );
  }
}
