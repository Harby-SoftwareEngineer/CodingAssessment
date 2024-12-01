
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../data/models/currency_dto.dart';

class Currency {
  bool? disabled;
  String? group;
  bool? selected;
  String? text;
  String? value;

  Currency({this.disabled, this.group, this.selected, this.text, this.value});

   factory Currency.fromDto(CurrencyDto json) => Currency(
        disabled: json.disabled,
        group: json.group,
        selected: json.selected,
        text: json.text,
        value: json.value,
      );

  static List<Currency> fromDtoList(List<CurrencyDto> list) {
    return list.map((e) => Currency.fromDto(e)).toList();
  }

  static List<DropDownItem> toDropDownItems(List<CurrencyDto> list) {
    return list
        .map(
          (e) => DropDownItem(
            id: e.value,
            title: e.text ?? '',
          ),
        )
        .toList();
  }
}

