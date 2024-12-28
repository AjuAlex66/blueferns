import 'dart:async';
import 'dart:convert';
import 'package:blueferns_taskaju/domain/initializer.dart';
import 'package:blueferns_taskaju/domain/respositories.dart';
import 'package:blueferns_taskaju/models/filterdatamodel.dart';
import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class FilterBloc extends Bloc<FilterEvents, FilterStates> {
  FilterBloc() : super(FilterStates()) {
    on<GetFilterData>(getFilterData);
  }

  Future<void> getFilterData(
      GetFilterData event, Emitter<FilterStates> emit) async {
    try {
      emit(GettingFilterData());
      Response response =
          await ApiRepository.getMethod(url: "/test/filter.json");
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Initializer.sortDataModel = SortDataModel.fromJson(data);
        if (Initializer.sortDataModel.data!.isNotEmpty) {
          bool? identified = false;
          FilterData? item;
          for (var e in Initializer.sortDataModel.data!) {
            if (e.slug!.toLowerCase() == "sort") {
              identified = true;
              item = e;
              item.isExpansionRequired = false;
              if (item.taxonomies!.isNotEmpty) {
                item.taxonomies!.first.isSelected = true;
                Initializer.changerProvider
                    .setSortValue(item.taxonomies!.first.slug!);
              }
              break;
            }
          }

          if (identified!) {
            Initializer.sortDataModel.data!.remove(item);
            Initializer.sortDataModel.data!.insert(0, item!);
          }
          emit(FilterDataFetched());
        } else {
          emit(FilterDataNotFound());
        }
      } else {
        emit(FilterDataNotFetched());
      }
    } catch (e) {
      Helper.showException(scope: "GetFilterData", message: e.toString());
      emit(GettingFilterDataError());
    }
  }
}

class FilterEvents {}

class FilterStates {}

// GET FILTER DATA ---->
class GetFilterData extends FilterEvents {}

class GettingFilterData extends FilterStates {}

class FilterDataFetched extends FilterStates {}

class FilterDataNotFetched extends FilterStates {}

class FilterDataNotFound extends FilterStates {}

class GettingFilterDataError extends FilterStates {}
// GET FILTER DATA <----
