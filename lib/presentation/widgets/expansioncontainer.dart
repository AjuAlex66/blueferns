import 'package:blueferns_taskaju/domain/initializer.dart';
import 'package:blueferns_taskaju/models/filterdatamodel.dart';
import 'package:blueferns_taskaju/presentation/providers/changerprovider.dart';
import 'package:blueferns_taskaju/presentation/style/styles.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpansionContainer extends StatelessWidget {
  final FilterData? filterData;
  const ExpansionContainer({super.key, required this.filterData});

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
            InkWell(
              onTap: () {
                filterData!.isExpanded = filterData!.isExpanded! ? false : true;
                if (filterData!.isExpanded!) {
                  Helper.hapticlight();
                } else {
                  Helper.hapticsoft();
                }
                Initializer.changerProvider.justChange();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  RichText(
                    text: TextSpan(
                      text: filterData!.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontVariations: fontVariations,
                        fontFamily: fontFamily,
                        color: black,
                      ),
                      children: [
                        TextSpan(
                          text: getSelectedCount(filterData!.taxonomies!),
                          style: const TextStyle(
                            fontSize: 14,
                            fontVariations: fontVariations,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontFamily,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    filterData!.isExpanded!
                        ? CupertinoIcons.chevron_up
                        : CupertinoIcons.chevron_down,
                    size: 16,
                  ),
                ],
              ),
            ),
            if (filterData!.isExpanded!) Helper.allowHeight(15),
            if (filterData!.isExpanded!)
              if (filterData!.taxonomies!.isNotEmpty)
                Column(
                  children: List.generate(
                      filterData!.taxonomies!.length,
                      (index) => Row(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Checkbox(
                                    value: filterData!
                                        .taxonomies![index].isSelected,
                                    onChanged: (value) => onChanged(
                                      value,
                                      index,
                                    ),
                                  )),
                              Helper.allowWidth(15),
                              Text(
                                filterData!.taxonomies![index].name ?? "N/A",
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

  getSelectedCount(List<Taxonomies> list) {
    var count = list.where((e) => e.isSelected!).toList().length;
    if (count > 0) {
      return " ($count)";
    } else {
      return "";
    }
  }

  void onChanged(bool? checkValue, int index) {
    filterData!.taxonomies![index].isSelected = checkValue;
    if (checkValue!) {
      Initializer.selectedFilterData!.add(filterData!.taxonomies![index]);
    } else {
      Initializer.selectedFilterData!.remove(filterData!.taxonomies![index]);
    }
    Initializer.changerProvider.justChange();
  }
}
