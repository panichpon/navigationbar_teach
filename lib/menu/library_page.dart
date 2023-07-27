import 'package:flutter/material.dart';
import 'package:navigationbar_teach/create_form/cl_create.dart';
import 'package:navigationbar_teach/create_form/cl_edit.dart';
import 'package:navigationbar_teach/model/profile_model.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<ProfileModel> proList =
      List.filled(0, ProfileModel.empty(), growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cl_create(proList.length),
                ),
              ).then((value) {
                if (value == null) {
                } else {
                  proList.add(value);
                }
                setState(() {});
              });
            },
          ),
        ],
      ),
      body: Container(
        child: (proList.isNotEmpty)
            ? ListView.builder(
                itemCount: proList.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(proList[index].globalName_li),
                    subtitle: Text(proList[index].type_li),
                    trailing: Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Cl_edit.setText(proList, index),
                              ),
                            ).then((value) {
                              if (value == null) {
                              } else {
                                proList = value;
                              }
                              setState(() {});
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            proList.removeWhere(
                                (element) => element.id == proList[index].id);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            : Container(),
      ),
    );
  }
}
