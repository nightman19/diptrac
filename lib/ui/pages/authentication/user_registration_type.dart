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
            const SizedBox(
              height: 120,
              child: Image(
                image: AssetImage('assets/images/diptrac_logo.png'),
              ),
            ),
            Row(
              children: [
                Text(
                  'Register to',
                  style: TextStyle(
                    fontSize: 48,
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
