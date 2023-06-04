class DeleteFavModel {
  DeleteFavModel({
      this.status, 
      this.data,});

  DeleteFavModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.userId, 
      this.like, 
      this.jobId, 
      this.image, 
      this.name, 
      this.location, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    like = json['like'];
    jobId = json['job_id'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['like'] = like;
    map['job_id'] = jobId;
    map['image'] = image;
    map['name'] = name;
    map['location'] = location;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}