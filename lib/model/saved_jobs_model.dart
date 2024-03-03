class SavedJobsModel{
  String? name;
  int? id;
  String? img;
  String? comp_name;
  String? location;
  int? saved;


  SavedJobsModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    id = json['id'];
    img = json['image'];
    comp_name = json['comp_name'];
    location = json['location'];
    saved = json['saved'];
  }
}