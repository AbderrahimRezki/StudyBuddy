import 'package:flutter/material.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCards(context, '55', 'Task          ', Icons.flash_on),
              _buildStatCards(context, '#2', 'Leaderboard', Icons.show_chart),
            ],
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                        context, '7.1H', 'Best day', Icons.access_time),
                    _buildStatCard(
                        context, '24.6H', 'Best week', Icons.date_range),
                    _buildStatCard(context, '10', 'Best streak',
                        Icons.local_fire_department),
                  ],
                ),
                const SizedBox(height: 25),
                _buildXPProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards(
      BuildContext context, String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 24), // Adjusted padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // More rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset:
                const Offset(0, 2), // Slightly less offset for a subtler shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFF59D11), size: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
              Text(
                label,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF9098A3),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      BuildContext context, String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0x81E8E8E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF006CDA), size: 28),
          Text(
            value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333)),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
          ),
        ],
      ),
    );
  }

  Widget _buildXPProgress() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '97XP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF32CD32)),
            ),
            Text(
              '48 Lifetime HOURS',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
        const SizedBox(
            height:
                15), // Adjust the space between the text and the progress bar as needed
        LinearProgressIndicator(
          value: 0.97,
          backgroundColor: const Color(0x81E8E8E8),
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF32CD32)),
          minHeight: 12, // Reduced thickness of the progress bar
          borderRadius: BorderRadius.circular(15),
        ),
      ],
    );
  }
}
