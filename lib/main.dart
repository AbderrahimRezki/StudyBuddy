import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/theme/theme.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => PageCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: MyColorScheme.backgroundColor,
                  appBar: (state.index > 1) ? const TopBar() : null,
                  body: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      state.pages[context.watch<PageCubit>().state.index],
                      if (state.index > 1) const MyNavigationBar()
                    ],
                  )));
        }));
  }
}
