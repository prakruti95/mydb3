import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mydb3/database/dbhelper.dart';

import '../color.dart';

class Contactscreen extends StatefulWidget
{
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen>
{
  final dbHelper = MyDb.instance;
  List<Map<String, dynamic>> allCategoryData = [];

  @override
  void initState()
  {
    // TODO: implement initState
    _query();
  }

  @override
  Widget build(BuildContext context)
  {
    return SafeArea(child: Scaffold
      (
        appBar: AppBar(title: Text("Contacts"),),
        body: Column(children:
        [
          Expanded
            (child: ListView.builder(
              itemBuilder: (context,index)
              {
                  var item = allCategoryData[index];
                  Uint8List bytes = base64Decode(item['profile']);
                    return Container
                      (
                        color: MyColors.orangeTile,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: Column(children:
                        [
                          Row(children:
                          [
                            SizedBox(height: 10,),
                            CircleAvatar(child: Image.memory(bytes,fit: BoxFit.cover,),minRadius: 20,maxRadius: 25,),
                            Text("${item['name']}"),
                            Text("${item['lname']}"),
                            Spacer(),
                            IconButton(onPressed: ()
                            {
                              _delete(item['_id']);
                            }, icon: Icon(Icons.delete),color:Colors.red,)

                          ],)
                        ],),

                      );
              },
              itemCount: allCategoryData.length,
            ),

            )
        ],),
      ));

  }

  void _query()async
  {
    final allRows = await dbHelper.querycontact();
    allRows.forEach(print);
    allCategoryData = allRows;
    print(allCategoryData.length);
    setState(() {

    });
  }
  void _delete(int id)async
  {
    final rowsDeleted = await dbHelper.deleteContact(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }


}
