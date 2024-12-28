import 'package:blueferns_taskaju/domain/initializer.dart';
import 'package:blueferns_taskaju/models/filterdatamodel.dart';
import 'package:blueferns_taskaju/presentation/blocs/filterbloc.dart';
import 'package:blueferns_taskaju/presentation/providers/changerprovider.dart';
import 'package:blueferns_taskaju/presentation/widgets/centerloading.dart';
import 'package:blueferns_taskaju/presentation/widgets/customchip.dart';
import 'package:blueferns_taskaju/presentation/widgets/errorview.dart';
import 'package:blueferns_taskaju/presentation/widgets/expansioncontainer.dart';
import 'package:blueferns_taskaju/presentation/widgets/noexpansioncontainer.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    Initializer.selectedFilterData!.clear();
    context.read<FilterBloc>().add(GetFilterData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Helper.pop(),
              icon: const Icon(Icons.chevron_left)),
          title: const Text("Filter Options")),
      body: BlocBuilder<FilterBloc, FilterStates>(
          buildWhen: (previous, current) =>
              current is GettingFilterData ||
              current is FilterDataFetched ||
              current is FilterDataNotFetched ||
              current is FilterDataNotFound ||
              current is GettingFilterDataError,
          builder: (context, state) => state is GettingFilterData
              ? const CenterLoading(color: Colors.black)
              : state is FilterDataFetched
                  ? ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 18),
                      children: [
                        sortSelectedView(context),
                        filterDataView(
                          context: context,
                          sortDataModel: Initializer.sortDataModel,
                        ),
                      ],
                    )
                  : state is FilterDataNotFound
                      ? const ErrorView(text: 'Oops... No data found')
                      : const ErrorView(
                          text:
                              "Something went wrong\nWe're unable to load data")),
    );
  }

  Widget filterDataView(
          {required BuildContext context,
          required SortDataModel sortDataModel}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          sortDataModel.data!.length,
          (index) => Column(
            children: [
              sortDataModel.data![index].isExpansionRequired!
                  ? ExpansionContainer(filterData: sortDataModel.data![index])
                  : NoExpansionConstainer(
                      filterData: sortDataModel.data![index]),
              if (index != sortDataModel.data!.length - 1)
                Helper.allowHeight(15)
            ],
          ),
        ),
      );

  sortSelectedView(BuildContext context) => Consumer<ChangerProvider>(
        builder: (context, value, child) => Initializer
                .selectedFilterData!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                        Initializer.selectedFilterData!.length,
                        (index) => CustomChip(
                              onTap: () {
                                for (var e in Initializer.sortDataModel.data!) {
                                  for (var f in e.taxonomies!) {
                                    if (f.id ==
                                        Initializer
                                            .selectedFilterData![index].id) {
                                      f.isSelected = false;
                                      break;
                                    }
                                  }
                                }
                                Initializer.selectedFilterData!.remove(
                                    Initializer.selectedFilterData![index]);
                                Initializer.changerProvider.justChange();
                              },
                              content:
                                  Initializer.selectedFilterData![index].name,
                            )),
                  ),
                  Helper.allowHeight(15),
                ],
              )
            : Helper.shrink(),
      );
}
