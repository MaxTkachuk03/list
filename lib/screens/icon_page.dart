import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:list/model/user_model.dart';
import 'package:list/services/services.dart';

class IconPage extends StatelessWidget {
  IconPage({super.key});

  static const String routeName = '/screens/icon';

  final UserServices services = UserServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: services.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserModel? userInfo = snapshot.data;
          if (userInfo != null) {
            return Image.network(userInfo.image);
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
