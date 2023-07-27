class ProfileModel{
  int id = 0;
  String globalName_li = '';
  String thaiName_li = '';
  String order_li = '';
  String family_li = '';
  String genus_li = '';
  String species_li = '';
  String type_li = '';
  String seasonFound_li = '';

  ProfileModel(int id, String globalName_li, String thaiName_li, String order_li,
      String family_li, String genus_li, String species_li, String type_li,
      String seasonFound_li){
    this.id = id;
    this.globalName_li = globalName_li;
    this.thaiName_li = thaiName_li;
    this.order_li = order_li;
    this.family_li = family_li;
    this.genus_li = genus_li;
    this.species_li = species_li;
    this.type_li = type_li;
    this.seasonFound_li = seasonFound_li;
  }

  ProfileModel.empty(){
    this.id = 0;
    this.globalName_li = '';
    this.thaiName_li = '';
    this.order_li = '';
    this.family_li = '';
    this.genus_li = '';
    this.species_li = '';
    this.type_li = '';
    this.seasonFound_li = '';
  }
}

