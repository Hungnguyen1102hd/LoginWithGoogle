import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_login/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInBloc>(context,listen: false);
              provider.logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 21,color: Colors.white),
            ),
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                (user.photoURL!),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.displayName!,
              style: const TextStyle(fontSize: 21,color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.email!,
              style: const TextStyle(fontSize: 21,color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
