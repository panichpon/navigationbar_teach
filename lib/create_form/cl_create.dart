import 'package:flutter/material.dart';
import 'package:navigationbar_teach/model/profile_model.dart';

class Cl_create extends StatefulWidget {
  int len = 0;
  Cl_create(int length) {
    this.len = length;
  }

  @override
  State<Cl_create> createState() => _Cl_createState(len);
}

class _Cl_createState extends State<Cl_create> {
  var globalName = TextEditingController();
  var thaiName = TextEditingController();
  var orderSci = TextEditingController();
  var familySci = TextEditingController();
  var genusSci = TextEditingController();
  var speciesSci = TextEditingController();
  var typeInsect = TextEditingController();
  var seasonFound = TextEditingController();
  int len = 0;

  _Cl_createState(int len) {
    this.len = len;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Form'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                pictureIcon(),
                textHeader('General info'),
                textFormF(
                    'Global name', 'Input global name of insect', globalName),
                textFormF('Thai name', 'Input thai name of insect', thaiName),
                textFormF('Type of insect', 'Input type of insect', typeInsect),
                textFormF('Season found', 'Input season found of insect',
                    seasonFound),
                textHeader('Science info'),
                textFormF('Order', 'Input order of insect', orderSci),
                textFormF('Family', 'Input family of insect', familySci),
                textFormF('Genus', 'Input genus of insect', genusSci),
                textFormF('Species', 'Input species of insect', speciesSci),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            'Add Data',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            print('Global name : ' + globalName.text);
                            print('Thai name : ' + thaiName.text);
                            print('Type : ' + typeInsect.text);
                            print('Season : ' + seasonFound.text);
                            print('Order : ' + orderSci.text);
                            print('Family : ' + familySci.text);
                            print('Genus : ' + genusSci.text);
                            print('Species : ' + speciesSci.text);

                            ProfileModel profile = ProfileModel(
                              len,
                              globalName.text,
                              thaiName.text,
                              orderSci.text,
                              familySci.text,
                              genusSci.text,
                              speciesSci.text,
                              typeInsect.text,
                              seasonFound.text,
                            );
                            Navigator.pop(context, profile);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            'Cancle',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding textFormF(
      String lText, String hText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lText,
          hintText: hText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Padding textHeader(String headText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        headText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blue,
        ),
      ),
    );
  }

  Padding pictureIcon() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.insert_photo,
        size: 100,
      ),
    );
  }
}
