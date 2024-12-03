
import 'package:app/core/widgets/texts/black_texts.dart';

import '../../../src/main_index.dart';

class SelectionButtonChip extends BaseStatelessWidget {
  final String? title;
  final String? initialValue;
  final List<ChipItem> types;
  final EdgeInsetsGeometry? paddingChip;
  final EdgeInsetsGeometry? margin;
  final void Function(ChipItem?)? onSelected;
  final bool isScrollableGrid;

  SelectionButtonChip({
    Key? key,
    this.title,
    this.initialValue,
    required this.types,
    this.margin,
    this.onSelected,
    this.paddingChip,
    this.isScrollableGrid = true,
  }) : super(key: key);

  ChipItem? selectedType;

  @override
  Widget build(BuildContext context) {
    _initialValue();
    return Padding(
      padding: margin ?? 0.paddingVert,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
          ...[Text(
            title ?? '',
            style: context.bodyMedium,
          ),
          5.ph,],
          StatefulBuilder(
            builder: (context, setState) {
              return isScrollableGrid
                  ? _buildChipsGrid(context, setState)
                  : _buildChips(context, setState);
            },
          ),
        ],
      ),
    );
  }

  void _initialValue() {
    selectedType = types.firstWhere( (element) => element.id == initialValue, orElse: () => types.first);
  }

  Widget _buildChips(
      BuildContext context, void Function(void Function()) setState) {
    return Wrap(
      runSpacing: 10,
      children: types
          .map((e) => SelectItem(
        isWrap: true,
        item: e,
        types: types,
        setState: setState,
        selectedType: selectedType,
        onSelected: (bool value) {
          setState(() {
            if(selectedType == e){
              selectedType = null;
            } else {
              selectedType =  e;
            }
            onSelected!(selectedType!);
          });
        },
        padding: paddingChip,
      ))
          .toList(),
    );
  }

  Widget _buildChipsGrid(
      BuildContext context, void Function(void Function()) setState) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: types.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: 0.paddingAll,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: types.length == 1 ? 1 : 2,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => SelectItem(
        item: types[index],
        types: types,
        setState: setState,
        isWrap: false,
        selectedType: selectedType,
        onSelected: (bool value) {
          setState(() {
            selectedType = types[index];
            onSelected!(selectedType);
          });
        },
        padding: paddingChip,
      ),
    );
  }
}

class ChipItem {
  final String? id;
  final String title;
  final String? icon;

  ChipItem({this.id, required this.title, this.icon});
}

class SelectItem extends BaseStatelessWidget {
  final ChipItem item;
  final List<ChipItem> types;
  final void Function(void Function()) setState;
  final void Function(bool)? onSelected;
  final ChipItem? selectedType;
  final EdgeInsetsGeometry? padding;
  final bool isWrap;

   SelectItem(
      {Key? key,
        required this.item,
        required this.types,
        required this.setState,
        this.onSelected,
        this.padding,
        this.selectedType,
        this.isWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedType == item;
    return ChoiceChip(
      label:  text(context),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      showCheckmark: false,
      selectedColor: context.primaryColor,
      backgroundColor: context.scaffoldBackgroundColor,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      elevation: 5,
      side: BorderSide(
        color: context.onPrimary.withOpacity(0.2),
        width: 1,
      ),
      padding: padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
      onSelected: onSelected,
    );
  }

  Widget text(BuildContext context) {
    bool isSelected = selectedType == item;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlackMediumText(
          label: item.title,
          labelColor: isSelected ? whiteRegularStyle.color : hintMediumStyle.color,
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
