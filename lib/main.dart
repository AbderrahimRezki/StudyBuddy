import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/app_providers.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/top_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/widgets/navigation_bar.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(MultiBlocProvider(
    providers: AppProviders.providers,
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: MyColorScheme.backgroundColor,
                  appBar: (state.pageHasBars()) ? const TopBar() : null,
                  body: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      state.currentPage,
                      if (state.pageHasBars()) const MyNavigationBar()
                    ],
                  )));
        }));
  }
}
