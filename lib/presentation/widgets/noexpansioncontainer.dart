import 'package:blueferns_taskaju/domain/initializer.dart';
import 'package:blueferns_taskaju/models/filterdatamodel.dart';
import 'package:blueferns_taskaju/presentation/providers/changerprovider.dart';
import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoExpansionConstainer extends StatelessWidget {
  final FilterData? filterData;
  const NoExpansionConstainer({super.key, required this.filterData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.2,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Consumer<ChangerProvider>(
        builder: (context, value, child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              filterData!.name!,
              style: const TextStyle(
                fontSize: 14,
                fontVariations: fontVariations,
                fontFamily: fontFamily,
                color: black,
              ),
            ),
            if (filterData!.taxonomies!.isNotEmpty) Helper.allowHeight(15),
            if (filterData!.taxonomies!.isNotEmpty)
              Column(
                children: List.generate(
                    filterData!.taxonomies!.length,
                    (index) => Row(
                          children: [
                            Selector<ChangerProvider, String>(
                              selector: (p0, p1) => p1.sortValue,
                              builder: (context, value, child) => SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Radio(
                                    groupValue: value,
                                    value: filterData!.taxonomies![index].slug,
                                    onChanged: (value) {
                                      if (filterData!.taxonomies![index].name !=
                                          null) {
                                        Initializer.changerProvider
                                            .changeSort(value);
                                      }
                                    },
                                  )),
                            ),
                            Helper.allowWidth(15),
                            index == 0
                                ? RichText(
                                    text: TextSpan(
                                        text: filterData!
                                                .taxonomies![index].name ??
                                            "N/A",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontVariations: fontVariations500,
                                            color: Colors.black,
                                            fontFamily: fontFamily),
                                        children: const [
                                        TextSpan(
                                          text: " (default)",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontVariations: fontVariations500,
                                            fontFamily: fontFamily,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ]))
                                : Text(
                                    filterData!.taxonomies![index].name ??
                                        "N/A",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontVariations: fontVariations500,
                                    ),
                                  )
                          ],
                        )),
              )
          ],
        ),
      ),
    );
  }
}
