class ProfileModel{
  String? name;

  ProfileModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
  }
}
