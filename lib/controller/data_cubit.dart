import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../Services/sharedprefeances.dart';
import '../models/SignInModel.dart';
import '../models/addFavModel.dart';
import '../models/deleteFavModel.dart';
import '../models/showFavModel.dart';
import '../models/showjobsModel.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  bool like=false;
  List likes=[false,false];

  List idList=[];
  List nameList=[];
 saveList(){
  for(int i=0;i<modelJob.data!.length;i++){
    idList.add(modelJob.data![i].id);
    nameList.add(modelJob.data![i].name);
  }
  print("lllllllllllisssssssttt${nameList}");
  emit(LocalListFav());

}

  SignInModel modelSign=SignInModel();
  Future<dynamic> postSignIn ({required String password,required String email})async {
    emit(DataSignLoading());
    try {
      http.Response response = await http.post(
          Uri.parse("http://167.71.79.133/api/auth/login",),
          body: {
            "password":password ,
            "email": email,
          }
      );
      SignInModel user=SignInModel.fromJson(jsonDecode(response.body));
      modelSign=user;
      emit(DataSignSuccess());
      MyCache.SetString(
          key: MyChachKey.token,
          value: "Bearer ${user.token.toString()}");
      MyCache.SetString(
          key: MyChachKey.userId,
          value: user.user!.id.toString());
      print("id is ...............${user.user!.id}");

    } on Exception catch (e) {
      emit(DataSignFailure());
      throw Exception(e.toString());

    }
  }


  SignInModel modelRegister=SignInModel();
  Future<dynamic> postRegister({required String name,required String email,required String password, dynamic body,}) async {
    try {
      String url="http://167.71.79.133/api/auth/register?name=$name&email=$email&password=$password";
      http.Response response = await http.post(Uri.parse(url), body: body);
      Map<String, dynamic> json = jsonDecode(response.body);
        SignInModel model=SignInModel.fromJson(json);
        modelRegister=model;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
      // print(modelRegister.token);

  }

  Showjobs modelJob=Showjobs();
  Future<Showjobs> getJob() async {
    emit(DataJobLoading());
    try {
      http.Response response = await http.get(
          Uri.parse(
            "http://167.71.79.133/api/jobs",
          ),
          headers: {
            'Authorization':MyCache.GetString(key: MyChachKey.token),
          });
      Map<String,dynamic> json=jsonDecode(response.body);
      Showjobs model = Showjobs.fromJson(json);
      print("loooooooooooook");
      print(model.data![1].compEmail);
      modelJob=model;
      saveList();
      showlIkes();
      emit(DataJobSuccess());
      return model;
    } on Exception catch (e) {
      emit(DataJobFailure());
      throw Exception(e.toString());

    }
  }



  AddFavorite modelAddFav=AddFavorite();
  Future<dynamic> addFavorites({required int jobId}) async {
    String userId=MyCache.GetString(key: MyChachKey.userId);
    try {
      String url="http://167.71.79.133/api/favorites?user_id=$userId&job_id=$jobId";
      http.Response response = await http.post(Uri.parse(url), headers:{
        'Authorization':MyCache.GetString(key: MyChachKey.token)
      } );
      Map<String, dynamic> json = jsonDecode(response.body);
      AddFavorite model=AddFavorite.fromJson(json);
      modelAddFav=model;
      addLikeFun();

      return model;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  addLikeFun(){
    for(int i=0;i<modelJob.data!.length;i++){
      if(modelJob.data![i].id.toString()==modelAddFav.data!.jobId.toString()){
        like=true;
        likes[i]=true;
      }
    }
    print("goood job $likes");
    emit(Likes());
  }

  removeLikeFun({required String jobId}){
    for(int i=0;i<modelJob.data!.length;i++){
      if(modelJob.data![i].id.toString()==jobId.toString()){
        like=true;
        likes[i]=false;
      }
    }
    print("goood job $likes");
    emit(Likes());
  }
  //////////////////////////////////testlikes/////////////////////////////////////
  showlIkes(){
    for(int i=0;i<nameList.length;i++){
      for(int j=0;j<showFavModel.data!.length;j++){
        if(showFavModel.data![j].name==nameList[i]){
          likes[i]=true;
          break;
      }
        else{likes[i]=false;}
      }
    }
    print(likes);
    emit(Likes());
  }
  //////////////////////////////////testlikes/////////////////////////////////////

int? getIdToDelete({required index}){

  var x=modelJob.data![index].id;
  for(int i=0;i<showFavModel.data!.length;i++)
    {
      if(showFavModel.data![i].jobId==x){
        var idForDelete=showFavModel.data![i].id;
        emit(IndexLisener());
        return idForDelete;
      }
    }
  return null;

}
  int? getIndex({required index}){

    var x=showFavModel.data![index].jobId;
    for(int i=0;i<modelJob.data!.length;i++)
    {
      if(modelJob.data![i].id==x){
        int inex=i;
        emit(IndexLisener());
        return inex;
      }
    }
    return null;

  }

  ShowFavModel showFavModel=ShowFavModel();
  Future<dynamic> showFavorites() async {
    emit(DataShowLoadingFavorites());
    try {
      String userId=MyCache.GetString(key: MyChachKey.userId);
      String url="http://167.71.79.133/api/favorites/$userId";
      http.Response response = await http.get(Uri.parse(url), headers:{
        'Authorization':MyCache.GetString(key: MyChachKey.token)
      } );
      Map<String, dynamic> json = jsonDecode(response.body);
      ShowFavModel model=ShowFavModel.fromJson(json);
      print(model.data?.length);
      emit(DataShowFavorites());
      showFavModel=model;
      // showlIkes();
      // print(favoriteList);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    // print(modelRegister.token);
  }

  DeleteFavModel deletmodel=DeleteFavModel();
  Future<dynamic> deleteFavorites({required int jobId}) async {
    emit(DataDeleteLoadingFavorites());
    try {
      String url="http://167.71.79.133/api/favorites/${jobId.toString()}";
      http.Response response = await http.delete(Uri.parse(url), headers:{
        'Authorization':MyCache.GetString(key: MyChachKey.token)
      } );
      deletmodel=DeleteFavModel.fromJson(jsonDecode(response.body));
      removeLikeFun(jobId:deletmodel.data!.jobId.toString());
     print(deletmodel.data!.name);
     print(deletmodel.data!.jobId);


      emit(DataDeleteFavorites());
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
  int groupValue=0;
  groupchange(int value){
    groupValue=value;
    emit(JobDetailsGroupValue());}


}
