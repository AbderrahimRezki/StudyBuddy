import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  static const pageRoute = "/achievement";
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        LevelProgressBar(
          currentLevel: 2,
          currentPoints: 5200,
          pointsNeeded: 6000,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Text(
            'Medals',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9098A3)),
          ),
        ),
        MedalsSection(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Text(
            'Certifications',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9098A3)),
          ),
        ),
        CertificationsSection(),
      ],
    );
  }
}

class LevelProgressBar extends StatelessWidget {
  final int currentLevel;
  final int currentPoints;
  final int pointsNeeded;

  const LevelProgressBar({
    Key? key,
    required this.currentLevel,
    required this.currentPoints,
    required this.pointsNeeded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = currentPoints / pointsNeeded;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.emoji_events, color: Color(0xFF32CD32)),
                Text(
                  'Level $currentLevel',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333)),
                ),
                Text(
                  '${pointsNeeded - currentPoints} Points to next level',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9098A3),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0x81E8E8E8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '$currentPoints/$pointsNeeded',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MedalsSection extends StatelessWidget {
  const MedalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MedalWidget(medalType: 'Gold', count: 24),
          MedalWidget(medalType: 'Silver', count: 18),
          MedalWidget(medalType: 'Bronze', count: 11),
        ],
      ),
    );
  }
}

class MedalWidget extends StatelessWidget {
  final String medalType;
  final int count;

  const MedalWidget({super.key, required this.medalType, required this.count});

  @override
  Widget build(BuildContext context) {
    Color medalColor;
    IconData medalIcon;

    switch (medalType) {
      case 'Gold':
        medalColor = Colors.yellow.shade700;
        medalIcon = Icons.star;
        break;
      case 'Silver':
        medalColor = Colors.grey.shade400;
        medalIcon = Icons.star_half;
        break;
      case 'Bronze':
        medalColor = Colors.brown;
        medalIcon = Icons.star_border;
        break;
      default:
        medalColor = Colors.grey;
        medalIcon = Icons.star;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth / 3 - 40;

    return Container(
      width: containerWidth,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(medalIcon, color: medalColor, size: 40),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            medalType,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF9098A3),
            ),
          ),
        ],
      ),
    );
  }
}

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double cardHeight = 200;
    double cardWidth = MediaQuery.of(context).size.width * 0.5;

    return SizedBox(
      height: cardHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CertificationWidget(
            title: 'Complete all day tasks',
            certificationType: 'Bronze',
            count: 24,
            width: cardWidth,
          ),
          CertificationWidget(
            title: 'Complete all month tasks',
            certificationType: 'Gold',
            count: 18,
            width: cardWidth,
          ),
// Add more CertificationWidgets as needed
// Duplicate for demonstration
          CertificationWidget(
            title: 'Complete all week tasks',
            certificationType: 'Silver',
            count: 12,
            width: cardWidth,
          ),
          CertificationWidget(
            title: 'New User Bonus',
            certificationType: 'Bronze',
            count: 5,
            width: cardWidth,
          ),
        ],
      ),
    );
  }
}

class CertificationWidget extends StatelessWidget {
  final String title;
  final String certificationType;
  final int count;
  final double width;

  const CertificationWidget({
    super.key,
    required this.title,
    required this.certificationType,
    required this.count,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    IconData certificationIcon;
    Color certificationColor;

    switch (certificationType) {
      case 'Gold':
        certificationIcon = Icons.verified_user;
        certificationColor = Colors.amber;
        break;
      case 'Bronze':
        certificationIcon = Icons.lock_open;
        certificationColor = Colors.deepOrange;
        break;
      case 'Silver':
        certificationIcon = Icons.verified;
        certificationColor = const Color(0xFFE8E8E8);
        break;
      default:
        certificationIcon = Icons.lock;
        certificationColor = const Color(0xFFE8E8E8);
    }

    return Container(
      width: width, // Use the width parameter
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(certificationIcon, color: certificationColor, size: 60),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$count Tasks',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9098A3),
            ),
          ),
        ],
      ),
    );
  }
}
