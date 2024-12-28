import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  const ErrorView({super.key, required this.text, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData ?? Icons.error),
          Helper.allowHeight(15),
          Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
