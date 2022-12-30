import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:list/model/user_model.dart';
import 'package:list/resources/fonts.dart';
import 'package:list/services/services.dart';
import 'package:list/widgets/icon_button.dart';
import 'package:list/widgets/theme_button.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    super.key,
  });

  static const String routeName = '/';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final UserServices services = UserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          FutureBuilder<UserModel?>(
            future: services.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel? userInfo = snapshot.data;
                if (userInfo != null) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButtonWrapper(
                                onPressed: () {

                                },
                                icon: userInfo.image,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                userInfo.name,
                                style: const TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.regular,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                userInfo.id,
                                style: const TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.regular,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ThemeButton(
                onPressed: () {
                  if (AdaptiveTheme.of(context).isDefault) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


/*



 */