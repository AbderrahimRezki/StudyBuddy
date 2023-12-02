import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        _buildActivityItem(
          icon: Icons.check_circle,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.diamond,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.timer,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.check_circle,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
        _buildActivityItem(
          icon: Icons.data_exploration,
          title: 'Earned Gold Certification',
          subtitle: 'May 1, 2022 • 5/5 Complete tasks',
        ),
      ],
    );
  }
}

Widget _buildActivityItem(
    {IconData? icon, String title = ' ', String subtitle = ' '}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.all(8),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFFF59D11)),
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF333333))),
      subtitle:
          Text(subtitle, style: const TextStyle(color: Color(0xFF9098A3))),
    ),
  );
}
