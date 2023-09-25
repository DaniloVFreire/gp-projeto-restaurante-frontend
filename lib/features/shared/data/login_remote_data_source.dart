import 'package:dio/dio.dart';
import 'package:sobre_mesa/core/constants/flags.dart';

import 'package:sobre_mesa/core/error/server_exceptions.dart';
import 'package:sobre_mesa/features/shared/domain/entities/login_data.dart';
import 'package:sobre_mesa/features/shared/domain/entities/user.dart';

class LoginRemoteDataSource {
  final Dio httpClient = Dio();
  User? getUser({required LoginData loginData}) {
    if (loginData.email == Flags.userAdminRole) {
      print(Flags.userAdminRole);
      return User(
          name: Flags.userAdminRole,
          email: Flags.userAdminRole,
          token: Flags.userAdminRole,
          role: Flags.userAdminRole);
    } else if (loginData.email == Flags.userCostomerRole) {
      print(Flags.userCostomerRole);
      return User(
          name: Flags.userCostomerRole,
          email: Flags.userCostomerRole,
          token: Flags.userCostomerRole,
          role: Flags.userCostomerRole);
    } else if (loginData.email == Flags.userCookerRole) {
      print(Flags.userCookerRole);
      return User(
          name: Flags.userCookerRole,
          email: Flags.userCookerRole,
          token: Flags.userCookerRole,
          role: Flags.userCookerRole);
    } else if (loginData.email == Flags.userWaiterRole) {
      print(Flags.userWaiterRole);
      return User(
          name: Flags.userWaiterRole,
          email: Flags.userWaiterRole,
          token: Flags.userWaiterRole,
          role: Flags.userWaiterRole);
    }
    print(Flags.loginFailed);
    return null;
  }
}
