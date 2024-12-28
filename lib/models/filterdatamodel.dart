class SortDataModel {
  List<FilterData>? data;

  SortDataModel({this.data});

  SortDataModel.fromJson(Map<String, dynamic> json) {
    data = <FilterData>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(FilterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilterData {
  String? name;
  String? slug;
  bool? isExpanded, isExpansionRequired;
  List<Taxonomies>? taxonomies;

  FilterData({this.name, this.slug, this.taxonomies});

  FilterData.fromJson(Map<String, dynamic> json) {
    isExpanded = false;
    isExpansionRequired = true;
    name = json['name'];
    slug = json['slug'];
    taxonomies = <Taxonomies>[];
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(Taxonomies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    if (taxonomies != null) {
      data['taxonomies'] = taxonomies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Taxonomies {
  int? id;
  String? guid;
  String? slug;
  String? name;
  String? city;
  bool? isSelected;
  List<Locations>? locations;

  Taxonomies(
      {this.id, this.guid, this.slug, this.name, this.city, this.locations});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    isSelected = false;
    id = json['id'];
    guid = json['Guid'];
    slug = json['slug'];
    name = json['name'];
    city = json['city'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Guid'] = guid;
    data['slug'] = slug;
    data['name'] = name;
    data['city'] = city;
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  int? id;
  String? guid;
  String? slug;
  String? name;

  Locations({this.id, this.guid, this.slug, this.name});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['Guid'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Guid'] = guid;
    data['slug'] = slug;
    data['name'] = name;
    return data;
  }
}
