import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100.0), // Adjust the height as needed
        child: AppBar(
          title: const Text('Notifications'),
          backgroundColor: const Color(0xFF006CDA),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF006CDA),
              unselectedLabelColor: const Color(0xFF9098A3),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent, // Indicator color
              isScrollable: true,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Missing'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(children: _buildAllNotifications()),
                ListView(children: _buildMissingNotifications()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAllNotifications() {
    return [
      _buildNotificationCard(Icons.check_circle, 'Earned Gold Certification',
          '5/5 Complete tasks', '2m', Colors.orange),
      _buildNotificationCard(Icons.warning, 'Missed Deadline',
          '0/5 Complete tasks', '1d', Colors.red),
      _buildNotificationCard(Icons.warning, 'Earned Gold Certification',
          'May 1, 2022 • 5/5 Complete tasks', '2d', Colors.amber),
      _buildNotificationCard(
          Icons.stars, 'Task Title', 'Due Time In 1 day', '2d', Colors.grey),
      _buildNotificationCard(Icons.timer, 'Earned Gold Medal',
          '10/10 Complete tasks', '3d', Colors.orange),
      _buildNotificationCard(Icons.check_circle, 'Earned Gold Certification',
          'May 1, 2022 • 5/5 Complete tasks', '4d', Colors.orange),
      _buildNotificationCard(Icons.warning, 'Earned Gold Certification',
          'May 1, 2022 • 5/5 Complete tasks', '5d', Colors.amber),
      _buildNotificationCard(
          Icons.stars, 'Task Title', 'Due Time In 1 day', '6d', Colors.grey),
      _buildNotificationCard(Icons.timer, 'Earned Gold Medal',
          '10/10 Complete tasks', '7d', Colors.orange),
      _buildNotificationCard(Icons.check_circle, 'Earned Gold Certification',
          'May 1, 2022 • 5/5 Complete tasks', '1w', Colors.orange),
      _buildNotificationCard(Icons.warning, 'Earned Gold Certification',
          'May 1, 2022 • 5/5 Complete tasks', '2w', Colors.amber),
      _buildNotificationCard(
          Icons.stars, 'Task Title', 'Due Time In 1 day', '2w', Colors.grey),
      _buildNotificationCard(Icons.timer, 'Earned Gold Medal',
          '10/10 Complete tasks', '1month', Colors.orange),
    ];
  }

  List<Widget> _buildMissingNotifications() {
    return [
      _buildNotificationCard(Icons.warning, 'Missed Deadline',
          '0/5 Complete tasks', '1d', const Color(0xFFFF3B30)),
    ];
  }

  Widget _buildNotificationCard(IconData icon, String title, String subtitle,
      String time, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF333333))),
        subtitle:
            Text(subtitle, style: const TextStyle(color: Color(0xFF9098A3))),
        trailing: Text(time),
      ),
    );
  }
}
