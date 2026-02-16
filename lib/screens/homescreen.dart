import 'package:flutter/material.dart';
import 'package:mydb3/database/dbhelper.dart';

import '../widget/mydrawer.dart';

class Homescreen extends StatefulWidget
{
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
{
  TextEditingController name = TextEditingController();
  MyDb db = MyDb.instance;


  @override
  Widget build(BuildContext context)
  {
    return SafeArea
      (
        child: Scaffold
        (
           appBar:AppBar(title: Text("Add Category"),) ,
           body: Center
             (
              child: Padding(
                padding: const EdgeInsets.all(68.0),
                child: Column
                  (

                    children:
                    [
                        TextFormField(controller: name,decoration: InputDecoration(hintText: "Enter Category",border: OutlineInputBorder()),),
                        SizedBox(height: 10),
                        ElevatedButton(onPressed: ()
                        {
                          insert();
                        }, child: Text("Add"))

                    ],
                  ),
              ),
             ),
           drawer: MyDrawer(),
        )

      );
  }

   insert()async
  {
    Map<String, dynamic> row = {MyDb.columnname: name.text.toString()};
    print('insert stRT');
    int id = await db.insertdata(row);
    print(id);
    name.text="";
  }
}
