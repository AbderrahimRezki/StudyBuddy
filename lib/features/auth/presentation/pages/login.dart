import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/config/theme/theme.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/states/page_state.dart';
import 'package:study_buddy/features/task/presentation/pages/list_tasks.dart';
import 'package:study_buddy/features/userprofile/bloc/user_cubit.dart';
import 'package:study_buddy/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NicknamePage extends StatefulWidget {
  static const pageRoute = "/login";
  const NicknamePage({super.key});

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final _formKey = GlobalKey();
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        locator<PageCubit>().changePage(TasksPage.pageRoute);
        locator<UserCubit>().getLoggedInUser();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check your email for a login link!')),
        );
        _emailController.clear();
      }
    } on AuthException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: MyColorScheme.green,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: MyColorScheme.red,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF007BFF);
    const Color orangeColor = Color(0xFFF39C12);

    return Scaffold(
        backgroundColor: blueColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset("assets/backgrounds/image2.png")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(flex: 3),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Start by entering your email',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                          fontSize: 24,
                          color: MyColorScheme.white,
                          backgroundColor: MyColorScheme.secondaryColor),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: blueColor,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    BlocBuilder<PageCubit, PageState>(
                      builder: (context, state) {
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _signIn,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: orangeColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 16),
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                                _isLoading ? 'Loading' : 'Send Magic Link'),
                          ),
                        );
                      },
                    ),
                    const Spacer(flex: 20),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
