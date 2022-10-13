import 'package:diptrac_user/data/models/models.dart';
import 'package:diptrac_user/ui/diptrac_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTypeCard extends StatelessWidget {
  final  onTapUserType;
  const UserTypeCard({Key? key, @required this.onTapUserType}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _userCardType(context),
      ],
    );
  }

  Widget _userCardType(BuildContext context){
    return InkWell(
      onTap: onTapUserType,
      child: Card(
        color: Colors.purple,
        child: SizedBox(
          height: 120,
          width: 350,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 96,
                  height: 96,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
