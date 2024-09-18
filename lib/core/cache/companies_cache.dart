// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

// class CompaniesCache {
//   static final CompaniesCache _instance = CompaniesCache._internal();

//   CompaniesCache._internal();

//   factory CompaniesCache.init() {
//     return _instance;
//   }

//   String read(String url) {
//     Box cache = Hive.box('companies');
//     print(cache.path);
//     return cache.get(url);
//   }

//   void write(String url, String data) {
//     Box cache = Hive.box('companies');
//     cache.put(url, data);
//   }
// }
