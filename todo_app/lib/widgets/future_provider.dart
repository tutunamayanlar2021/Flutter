import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/cat_facts_model.dart';

final httpClientProvider = Provider<Dio>(((ref) {
  return Dio(BaseOptions(baseUrl: 'https://catfact.ninja/'));
}));
final catFactsProvider = FutureProvider.autoDispose
    .family<List<CatFactsModel>, Map<String, dynamic>>(
        (ref, parametreMap) async {
  final dio = ref.watch(httpClientProvider);

  final result = await dio.get('facts', queryParameters: parametreMap);
  ref.maintainState; //keepalive;

  List<Map<String, dynamic>> mapData = List.from(result.data['data']); //mühim
  List<CatFactsModel> catFactList =
      (mapData.map((e) => CatFactsModel.fromMap(e)).toList());
  return catFactList;
});

class FutureProviderWidget extends ConsumerWidget {
  const FutureProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var liste =
        ref.watch(catFactsProvider(const {'limit': 20, 'max_length': 70}));
    return Scaffold(
      body: SafeArea(
        child: liste.when(data: (liste) {
          
          return ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(liste[index].fact),
                );
              });
        }, error: (err, Stack) {
          return Center(
            child: Text('Hata Çıktı Veriler getirelemedi ${err.toString()}'),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
