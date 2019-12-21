import 'package:provider/provider.dart';

import 'models/user.dart';
import 'services/dio_client.dart';
import 'services/api.dart';

List<SingleChildCloneableWidget> providers = [
  ..._independentServices,
  ..._dependentServices,
  ..._uiConsumableProviders
];

List<SingleChildCloneableWidget> _independentServices = [
  Provider.value(value: DioClient())
];

List<SingleChildCloneableWidget> _dependentServices = [
  ProxyProvider<DioClient, Api>(
    create: (_) => Api(),
    update: (_, dio, api) => api..dioClient = dio,
  )
];

List<SingleChildCloneableWidget> _uiConsumableProviders = [
  ChangeNotifierProxyProvider<Api, UserModel>(
    create: (_) => UserModel(),
    update: (_, api, userModel) => userModel..api = api,
  )
];
