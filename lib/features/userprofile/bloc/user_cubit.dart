import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/core/constants/dummy.dart';
import 'package:study_buddy/dependency_injection.dart';
import 'package:study_buddy/features/auth/presentation/pages/login.dart';
import 'package:study_buddy/features/skeleton/presentation/bloc/cubits/page_cubit.dart';
import 'package:study_buddy/features/userprofile/bloc/user_state.dart';
import 'package:study_buddy/features/userprofile/domain/entities/user_entity.dart';
import 'package:study_buddy/main.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(loggedInUser: anonymousUser));

  getLoggedInUser() async {
    try {
      final userId = supabase.auth.currentUser?.id;
      final userEmail = supabase.auth.currentUser?.email;

      print("Email: $userEmail");

      final data = await supabase
          .from("profiles")
          .select("*")
          .eq("id", userId!)
          .single();

      await supabase
          .from("profiles")
          .update({"username": (userEmail?.split("@")[0] ?? "Anonymous")}).eq(
              "id", userId);

      final loggedInUser = UserEntity(
          userId: (data["id"] ?? ""),
          nickName: (userEmail?.split("@")[0] ?? "Anonymous"),
          progress: (data['progress'] ?? 0),
          profilePicturePath: (data["avatar_url"] ?? "assets/images/male.png"));

      print("Logged in user: $loggedInUser");

      emit(UserState(loggedInUser: loggedInUser));
    } catch (e, stacktrace) {
      print("Error: $e\nStack Trace: $stacktrace");
    }
  }

  logOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      debugPrint("Something went wrong");
    } finally {
      locator<PageCubit>().changePage(NicknamePage.pageRoute);
    }
  }

  updateUserProgress({int delta = 0}) async {
    if (state.loggedInUser != null) {
      final userId = state.loggedInUser!.userId;

      if (userId == null) {
        return;
      } else {
        final response = await supabase.from("profiles").update({
          "progress": (state.loggedInUser?.progress ?? 0) + delta
        }).eq("id", userId);

        print(response);

        emit(UserState(
            loggedInUser: state.loggedInUser?.copyWith(
                progress: (state.loggedInUser?.progress ?? 0) + delta)));
      }
    }
  }
}
