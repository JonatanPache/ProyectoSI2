import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/poliza.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';

class PolizaProvider extends ChangeNotifier{
  List<Poliza> polizas=[];
  late ApiService apiService;
  late AuthProvider authProvider;

  PolizaProvider(AuthProvider authProvider){
    this.authProvider=authProvider;
    this.apiService=ApiService(authProvider.token);
    //init();
  }

  /*Future init() async{
    polizas= await apiService.fetchPolizas();
    notifyListeners();
  }*/

  /*Future<void> addCategory(String name) async{
    try{
      Poliza addedCategory=await apiService.addCategory(name);
      categories.add(addedCategory);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<void> updateCategory(Category category) async{
    try{
      Category updateCategory=await apiService.updateCategory(category);
      int index=categories.indexOf(category);
      categories[index]=updateCategory;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future deleteCategory(Category category) async{
    try{
      await apiService.deleteCategory(category.id);
      categories.remove(category);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }*/
}