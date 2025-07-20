import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_e_commerce/features/profile_feature/presentation/views/widgets/guest_user_profile.dart';
import 'package:simple_e_commerce/features/profile_feature/presentation/views/widgets/user_with_credentials_profile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});
  static late User? user;
  static late bool isGuest;

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    ProfileViewBody.user = FirebaseAuth.instance.currentUser;
    ProfileViewBody.isGuest = ProfileViewBody.user == null;
  }

  @override
  Widget build(BuildContext context) {
    return ProfileViewBody.isGuest
        ? GuestUserProfile()
        : UserWithCredentialsProfile();
  }
}
