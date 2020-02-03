import 'package:bloc/bloc.dart';
import 'package:mvvm_bloc_sample/model/user.dart';

class UserBloc extends Bloc<int, User>{
  @override
  User get initialState => UninitializedUser();

  @override
  Stream<User> mapEventToState(int event) async*{
    try{
      User user = await User.getUserFromApi(event);
      yield user; //yield adds a value to the output stream of the surrounding async* function. It's like return, but doesn't terminate the function.
    } catch (_){
       
    }
  }

}