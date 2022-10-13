import 'package:diptrac_user/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:diptrac_user/data/models/models.dart';

class DeliverypointPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: DiptracPages.deliverypointPath,
      key: ValueKey(DiptracPages.deliverypointPath),
      child: const DeliverypointPage(),
    );
  }
  const DeliverypointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
