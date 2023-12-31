import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/features/landing_page/presentation/pages/welcome.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';

class SplashScreen extends StatefulWidget {
  static const pageRoute = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.read<PageCubit>().changePage(StudyBuddyPage.pageRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200, height: 200, child: Image.asset("assets/logo/logo.png")),
    );
  }
}
