import 'package:flutter/foundation.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';
import 'package:cpyd_app_g1/model/pokemons_model.dart';
import 'package:http/http.dart' as http;

class PokemonProvider with ChangeNotifier {
  final String _baseURL = 'https://pokeapi.co/api/v2/pokemon?limit=10';

  PokemonsModel _pokemons = PokemonsModel();
  PokemonsModel get pokemons => _pokemons;

  final List<PokemonDetailModel> _pokemonsDetail = [];
  List<PokemonDetailModel> get pokemonsDetail => _pokemonsDetail;
  
  int cont = -10;

  Future<dynamic> getPokemons() async {
      cont = cont+10;
      Uri url = Uri.parse(_baseURL+'&offset='+cont.toString());
      final response = await http.get(url);
      final data = pokemonsModelFromJson(response.body);

      if (response.statusCode == 200) {
        _pokemons = data;
        notifyListeners();

      for(int i=cont-10;i<=cont;i++){
        _pokemonsDetail.removeWhere((PokemonDetailModel) => PokemonDetailModel.id == i);
      }

        for (var result in _pokemons.results!) {
          await getPokemonsDetail(resultURL: result.url!);
        }
      }
  }

  Future<dynamic> backPokemons() async {
    if(cont == 0){}
    else{
      cont = cont-10;
      Uri url = Uri.parse(_baseURL+'&offset='+cont.toString());
      final response = await http.get(url);
      final data = pokemonsModelFromJson(response.body);

      if (response.statusCode == 200) {
        _pokemons = data;
        notifyListeners();

      for(int i=cont+20;i>=cont;i--){
          _pokemonsDetail.removeWhere((PokemonDetailModel) => PokemonDetailModel.id == i);
      }
        for (var result in _pokemons.results!) {
          await getPokemonsDetail(resultURL: result.url!);
        }
      }
    }
  }

  Future<dynamic> getPokemonsDetail({required String resultURL}) async {
    try {
      Uri url = Uri.parse(resultURL);
      final response = await http.get(url);
      final data = pokemonDetailModelFromJson(response.body); 

      if (response.statusCode == 200) {
        _pokemonsDetail.add(data);
        notifyListeners();

        return _pokemonsDetail;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
