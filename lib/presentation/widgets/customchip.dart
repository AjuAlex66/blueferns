import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String? content;
  final Function()? onTap;
  const CustomChip({super.key, this.onTap, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.close, size: 16),
            Helper.allowWidth(5),
            Text(
              content!,
              style: const TextStyle(
                  fontSize: 12, fontVariations: fontVariations),
            )
          ],
        ),
      ),
    );
  }
}
