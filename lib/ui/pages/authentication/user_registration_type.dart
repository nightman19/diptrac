import 'package:diptrac_user/data/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
class UserRegistrationType extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DiptracPages.userRegistrationTypePath,
      key: ValueKey(DiptracPages.userRegistrationTypePath),
      child: const UserRegistrationType(),
    );
  }

  const UserRegistrationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Register \nto',
                  style: TextStyle(
                    fontSize: 64,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                UserTypeCard(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                UserTypeCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
