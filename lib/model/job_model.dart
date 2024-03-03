class JobModel{
  String? name;
  int? id;
  String? img;
  String? jobTime;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkills;
  String? job_time_type;
  String? job_type;
  String? salary;
  String? about_company;
  String? comp_email;
  String? comp_website;
  String? comp_name;
  String? location;


  JobModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    id = json['id'];
    img = json['image'];
    job_time_type = json['job_time_type'];
    job_type = json['job_type'];
    salary = json['salary'];
    jobDescription = json['job_description'];
    jobSkills = json['job_skill'];
    about_company = json['about_comp'];
    comp_email = json['comp_email'];
    comp_website = json['comp_website'];
    comp_name = json['comp_name'];
    location = json['location'];
  }
}