import 'package:diptrac_user/data/models/models.dart';
import 'package:diptrac_user/ui/pages/pages.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class UserRegistrationType extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DiptracPages.userRegistrationTypePath,
      key: ValueKey(DiptracPages.userRegistrationTypePath),
      child: const UserRegistrationType(),
    );
  }

  const UserRegistrationType({
    Key? key,
  }) : super(key: key);

  @override
  State<UserRegistrationType> createState() => _UserRegistrationTypeState();
}

class _UserRegistrationTypeState extends State<UserRegistrationType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
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
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 16)),
                  Text(
                    'Register to',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              UserTypeCard(
                onTapUserType: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliverymanPage(),

                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              UserTypeCard(
                onTapUserType: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliverypointPage(),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
