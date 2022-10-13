import 'package:flutter/material.dart';
import 'package:diptrac_user/data/models/models.dart';


class DeliverymanPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DiptracPages.deliverymanPath,
      key: ValueKey(DiptracPages.deliverymanPath),
      child: const DeliverymanPage(),
    );
  }

  const DeliverymanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
