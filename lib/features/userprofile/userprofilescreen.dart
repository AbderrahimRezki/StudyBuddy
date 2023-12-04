import 'package:flutter/material.dart';
import '../notifications/notifications.dart';
import 'stat.dart';
import 'achievements.dart';
import 'activity.dart';

class UserProfileScreen extends StatelessWidget {
  static const pageRoute = "/profile";
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF006CDA),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Color(0xFFF59D11), size: 30),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationsPage.pageRoute);
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 190, // Add space for the avatar
                floating: false,
                pinned: true,
                elevation: 0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0,
                              0.3), // Adjust the end position of the gradient here
                          colors: <Color>[
                            Color(0xFF006CDA), // Blue color
                            Color(0xFFFAF9F9), // color
                          ],
                        ),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 10,
                            left: MediaQuery.of(context).size.width / 2 -
                                avatarRadius,
                            child: const CircleAvatar(
                              radius: avatarRadius,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: avatarRadius - 2,
                                backgroundImage:
                                    AssetImage('assets/images/male.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF32CD32),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 2),
                                    child: const Text(
                                      '97 XP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Mohamed',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ];
          },
          body: const Column(
            children: [
              Material(
                color: Color(0x00fdfdfd), // Color of the TabBar
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(),
                  labelColor: Color(0xFF006CDA),
                  unselectedLabelColor: Color(0xFF9098A3),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  tabs: [
                    Tab(text: 'STATS'),
                    Tab(text: 'ACHIEVEMENT'),
                    Tab(text: 'ACTIVITY'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    StatPage(),
                    AchievementsPage(), // ACHIEVEMENTS content
                    ActivityPage(), // ACTIVITY content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
