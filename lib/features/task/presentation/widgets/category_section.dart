import 'package:flutter/material.dart';
import 'package:study_buddy/features/task/domain/entities/category_entity.dart';
import 'package:study_buddy/features/task/presentation/widgets/category_chip.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryEntity> categories;
  final Map<CategoryEntity, bool> selectedCategories;

  const CategorySection(
      {super.key, required this.categories, required this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: categories
              .map<Widget>((category) => CategoryChip(
                    category: category,
                    isSelected: selectedCategories[category] ?? false,
                    onSelected: (bool selected) {
                      selectedCategories[category] =
                          !(selectedCategories[category] ??= false);
                    },
                  ))
              .toList()),
    );
  }
}

// class AddCategoryButton extends StatelessWidget {
//   const AddCategoryButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.add_circle, color: Color(0xFF006CDA)),
//       onPressed: () {
//         // Handle add category button press
//       },
//     );
//   }
// }
