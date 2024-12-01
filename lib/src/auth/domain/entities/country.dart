import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../data/models/country_dto.dart';

class Country {
  String? id;
  String? name;
  String? arName;
  bool? isSupported;
  String? alpha2Code;
  String? alpha3Code;
  String? numericCode;
  String? flag;
  String? createdDate;
  String? updatedDate;
  String? createdBy;
  String? updatedBy;

  Country(
      {this.id,
      this.name,
      this.arName,
      this.isSupported,
      this.alpha2Code,
      this.alpha3Code,
      this.numericCode,
      this.flag,
      this.createdDate,
      this.updatedDate,
      this.createdBy,
      this.updatedBy});

  factory Country.fromDto(CountryDto json) => Country(
        id: json.id,
        name: json.name,
        arName: json.arName,
        isSupported: json.isSupported,
        alpha2Code: json.alpha2Code,
        alpha3Code: json.alpha3Code,
        numericCode: json.numericCode,
        flag: json.flag,
        createdDate: json.createdDate,
        updatedDate: json.updatedDate,
        createdBy: json.createdBy,
        updatedBy: json.updatedBy,
      );

  static List<Country> fromDtoList(List<CountryDto> list) {
    return list.map((e) => Country.fromDto(e)).toList();
  }

  static List<DropDownItem> toDropDownItems(List<CountryDto> list) {
    return list
        .map(
          (e) => DropDownItem(
            id: e.id,
            title: e.name ?? '',
          ),
        )
        .toList();
  }
}
