

import 'package:myproject/src/config/config.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
class ApiEndPoint{
  const ApiEndPoint._();
  static const baseUrl=Config.baseUrl;
  
  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint){
    const path='api/auth';
    switch (endpoint) {
      case AuthEndpoint.register : return '$path/register';
     case AuthEndpoint.login: return '$path/login';
    }
  }

  /// Returns the path for a user [endpoint].
  ///
  /// Specify student [erp] to get the path for a specific student.
  /// 
  /// Specify secondary [extendedResourceId] to get the path for a specific secondary resource.
  
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  /// An endpoint for registration requests.
  register,

  /// An endpoint for login requests.
  login,

  
}