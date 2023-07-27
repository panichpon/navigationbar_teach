import 'package:flutter/material.dart';
import 'package:navigationbar_teach/model/profile_model.dart';

class Cl_edit extends StatefulWidget {
  List<ProfileModel> profileList =
      List.filled(0, ProfileModel.empty(), growable: true);
  int id = 0;

  Cl_edit.setText(List<ProfileModel> proList, int id) {
    this.profileList = proList;
    this.id = id;
  }

  @override
  State<Cl_edit> createState() => _Cl_editState(profileList, id);
}

class _Cl_editState extends State<Cl_edit> {
  List<ProfileModel> proList =
      List.filled(0, ProfileModel.empty(), growable: true);
  int id = 0;

  _Cl_editState(List<ProfileModel> profileList, int idx) {
    proList = profileList;
    id = idx;
    globalName.text = profileList[id].globalName_li;
    thaiName.text = profileList[id].thaiName_li;
    orderSci.text = profileList[id].order_li;
    familySci.text = profileList[id].family_li;
    genusSci.text = profileList[id].genus_li;
    speciesSci.text = profileList[id].species_li;
    typeInsect.text = profileList[id].type_li;
    seasonFound.text = profileList[id].seasonFound_li;
  }

  var globalName = TextEditingController();
  var thaiName = TextEditingController();
  var orderSci = TextEditingController();
  var familySci = TextEditingController();
  var genusSci = TextEditingController();
  var speciesSci = TextEditingController();
  var typeInsect = TextEditingController();
  var seasonFound = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                PictureIcon(),
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
                            var edit = proList
                                .firstWhere((element) => element.id == id);
                            edit.globalName_li = globalName.text;
                            edit.thaiName_li = thaiName.text;
                            edit.type_li = typeInsect.text;
                            edit.seasonFound_li = seasonFound.text;
                            edit.order_li = orderSci.text;
                            edit.family_li = familySci.text;
                            edit.genus_li = genusSci.text;
                            edit.species_li = speciesSci.text;
                            Navigator.pop(context, proList);
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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blue,
        ),
      ),
    );
  }

  Padding PictureIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.insert_photo,
        size: 100,
      ),
    );
  }
}
