
import 'package:pokedex/helper/enum.dart';
import 'package:pokedex/model/MovesList.dart';
import 'appState.dart';

class MoveState extends AppState{
   List<Result> _movesList;
   List<Result> get movesList {
     if(_movesList == null){
       return null;
     }
     else{
       return List.from(_movesList);
     }
   }

   String _nextUrl ;
  Future<void> getMovesList(HomePageButtonEnum pageType,{bool initialLoad = true})async{
      try{
          apiCall(isReady: true,);
          if(initialLoad){
            _nextUrl = null;
          }
          if(!initialLoad && _nextUrl == null){
            print('All items fetched');
            return;
          }
    }
    catch(error){
      apiCall(isReady: false,isnotify: true,isApiError: true);
      print('ERROR [getMovesList]: $error');
    }
  }
}