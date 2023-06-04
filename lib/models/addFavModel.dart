class AddFavorite {
  AddFavorite({
      this.status, 
      this.data,});

  AddFavorite.fromJson(dynamic json) {
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
      this.userId, 
      this.jobId, 
      this.like, 
      this.image, 
      this.name, 
      this.location, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    jobId = json['job_id'];
    like = json['like'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? userId;
  String? jobId;
  bool? like;
  String? image;
  String? name;
  String? location;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['job_id'] = jobId;
    map['like'] = like;
    map['image'] = image;
    map['name'] = name;
    map['location'] = location;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}