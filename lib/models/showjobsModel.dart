class Showjobs {
  Showjobs({
      this.status, 
      this.data,});

  bool? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Showjobs.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.image, 
      this.jobTimeType, 
      this.jobType, 
      this.jobLevel, 
      this.jobDescription, 
      this.jobSkill, 
      this.compName, 
      this.compEmail, 
      this.compWebsite, 
      this.aboutComp, 
      this.location, 
      this.salary, 
      this.favorites, 
      this.expired, 
      this.createdAt, 
      this.updatedAt,});

  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    jobTimeType = json['job_time_type'];
    jobType = json['job_type'];
    jobLevel = json['job_level'];
    jobDescription = json['job_description'];
    jobSkill = json['job_skill'];
    compName = json['comp_name'];
    compEmail = json['comp_email'];
    compWebsite = json['comp_website'];
    aboutComp = json['about_comp'];
    location = json['location'];
    salary = json['salary'];
    favorites = json['favorites'];
    expired = json['expired'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['job_time_type'] = jobTimeType;
    map['job_type'] = jobType;
    map['job_level'] = jobLevel;
    map['job_description'] = jobDescription;
    map['job_skill'] = jobSkill;
    map['comp_name'] = compName;
    map['comp_email'] = compEmail;
    map['comp_website'] = compWebsite;
    map['about_comp'] = aboutComp;
    map['location'] = location;
    map['salary'] = salary;
    map['favorites'] = favorites;
    map['expired'] = expired;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}