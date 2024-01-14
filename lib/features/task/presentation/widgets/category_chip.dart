import 'package:flutter/material.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';

class CategoryChip extends StatefulWidget {
  final CategoryEntity category;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool? isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.category.categoryName),
      selected: isSelected!,
      onSelected: (bool selected) {
        widget.onSelected(selected);
        isSelected = !isSelected!;
        setState(() {});
      },
      selectedColor: const Color(0xFF32CD32),
      backgroundColor: const Color(0x81E8E8E8),
      labelStyle: TextStyle(
        color: isSelected! ? MyColorScheme.white : MyColorScheme.green,
      ),
    );
  }
}
