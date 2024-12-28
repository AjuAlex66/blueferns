import 'package:blueferns_taskaju/models/filterdatamodel.dart';
import 'package:blueferns_taskaju/presentation/providers/changerprovider.dart';

class Initializer {
  static SortDataModel sortDataModel = SortDataModel();
  static ChangerProvider changerProvider = ChangerProvider();
  static List<Taxonomies>? selectedFilterData = <Taxonomies>[];
}
