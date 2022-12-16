import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';
import '../constant.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  final VoidCallback onTap;
  const PokemonWidget({Key? key, required this.pokemon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getBackGroundColor(
            pokemon.types![0].type!.name!,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Stack(
          children: <Widget>[
            Center(
                child: Image.network(
              pokemon.sprites!.other!.officialArtwork!.frontDefault!,
            )),
            Text(
              "#${pokemon.id.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(8),
                // ignore: sort_child_properties_last
                child: Text("${pokemon.name}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
