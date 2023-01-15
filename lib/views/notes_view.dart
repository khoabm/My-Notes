import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/services/auth/auth_services.dart';

import '../constant/routes.dart';
import '../enums/menu_action.dart';
import '../main.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogoutDialog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logout();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }

                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                )
              ];
            },
          )
        ],
      ),
      body: const Text('Hello World!!!'),
    );
  }
}

// void getHttp() async {
//   try {
//     var response = await Dio()
//         .get('https://30f2-171-250-162-42.ap.ngrok.io/api/HangHoas?page=1');
//     print(response);
//   } catch (e) {
//     print(e);
//   }
// }
