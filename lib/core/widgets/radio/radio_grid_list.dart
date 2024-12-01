import 'package:app/src/main_index.dart';
import 'package:flutter/material.dart';

import 'custom_radio_list.dart';
import 'custom_radio_list_tile2.dart';

///  Created by harbey on 7/11/2023.
class RadioGridList extends StatelessWidget {
  final List<RadioItem> items;
  final String groupValue;
  final Color? color;
  final int crossAxisCount;
  final void Function(RadioItem)? onChanged;
  const RadioGridList({
    Key? key,
    required this.items,
    this.color,
    required this.groupValue,
    required this.onChanged,
    this.crossAxisCount = 2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String groupValue = this.groupValue;
    return Padding(
      padding: 10.paddingAll,
      child: StatefulBuilder(builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            return context.width > 600
                ? CustomRadioListTile2(
                    title: item.title,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                      onChanged!(item);
                    }
                  )
                :
              FittedBox(
              child: CustomRadioListTile2(
                title: item.title,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                  onChanged!(item);
                },
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}

class RadioItem {
  final String value;
  final String title;
  final String tooltipMessage;
  RadioItem({required this.value, required this.title, this.tooltipMessage = ''});

  static listFrom(List items) {
    List<RadioItem> list = [];
    for (var item in items) {
      list.add(RadioItem(value: item.productId, title: item.storeName, tooltipMessage: item.tooltipMessage ?? ''));
    }
    return list;
  }
}
