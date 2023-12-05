import 'package:flutter/material.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';

class AddTaskScreenState extends StatefulWidget {
  static const pageRoute = "/add";
  const AddTaskScreenState({super.key});

  @override
  State<AddTaskScreenState> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreenState> {
  List<String> categories = [
    'Math',
    'Physique',
    'His/Geo',
    'Science',
    'Phylo',
    'Techno',
    'Islamia',
    'Design',
    'Sport',
    'Others'
  ];
  Map<String, bool> selectedCategories = {};

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      selectedCategories[category] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TopBar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  _buildTaskCard(),
                  const SizedBox(height: 20),
                  _buildCategorySection(),
                  const SizedBox(height: 20),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  fontSize: 18,
                ),
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Today I will do ... ',
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
              maxLines: 3,
              onSaved: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
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
        children:
            categories.map((category) => _buildCategoryChip(category)).toList()
              ..add(_buildAddCategoryButton()),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final bool isSelected = selectedCategories[category]!;
    return ChoiceChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          selectedCategories[category] = selected;
        });
      },
      selectedColor: const Color(0xFF32CD32),
      backgroundColor: const Color(0x81E8E8E8),
      labelStyle:
          TextStyle(color: isSelected ? Colors.white : const Color(0xFF333333)),
    );
  }

  Widget _buildAddCategoryButton() {
    return IconButton(
      icon: const Icon(Icons.add_circle, color: Color(0xFF006CDA)),
      onPressed: () {},
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            backgroundColor: const Color(0xFF32CD32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
