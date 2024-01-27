import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/auth/presentation/pages/login.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';

class StudyBuddyPage extends StatelessWidget {
  static const pageRoute = "/welcome";
  const StudyBuddyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF007BFF);
    const Color orangeColor = Color(0xFFF39C12);

    return BlocBuilder<PageCubit, PageState>(
        builder: (context, state) => Scaffold(
              backgroundColor: blueColor,
              body: Stack(alignment: Alignment.bottomRight, children: [
                const SizedBox.expand(),
                Image.asset(
                  "assets/backgrounds/image.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                        width: double.infinity,
                      ),
                      const Text(
                        'StudyBuddy',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Unlock your academic\npotential',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white.withOpacity(0.9),
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 48),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<PageCubit>()
                              .changePage(NicknamePage.pageRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: orangeColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Get Started'),
                      ),
                    ],
                  ),
                ),
              ]),
            ));
  }
}
