import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydb3/screens/homescreen.dart';

import '../color.dart';
import '../screens/addcontactscreen.dart';
import '../screens/contactscreen.dart';

class MyDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Container
        (
          margin: EdgeInsets.only(top: 55),
          child: Drawer
            (
              backgroundColor: MyColors.drawalBackground,
              child: ListView
                (
                  padding: EdgeInsets.zero,
                  children:
                  [
                    ListTile(
                      title: const Text(
                        'Add Category',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                      },
                    ),
                    Divider(
                      color: MyColors.drawalDivider,
                      height: 2,
                      thickness: 2,
                    ),
                    ListTile(
                      title: const Text(
                        'Add Contact',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AddContact()));
                      },
                    ),
                    Divider(
                      color: MyColors.drawalDivider,
                      height: 2,
                      thickness: 2,
                    ),
                    ListTile(
                      title: const Text(
                        'Contact List',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Contactscreen()));
                      },
                    ),
                    Divider(
                      color: MyColors.drawalDivider,
                      height: 2,
                      thickness: 2,
                    ),

                  ],
                ),
            ),
        );
  }

}