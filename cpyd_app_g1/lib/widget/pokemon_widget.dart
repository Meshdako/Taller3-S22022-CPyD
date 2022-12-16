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
            Text(
              "#${pokemon.id.toString()} ${pokemon.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white),
            ),
            Center(
              child: Container(
                  child: const Align(
                alignment: Alignment(50, 50),
              )),
            ),
            Center(
                child: Image.network(
              pokemon.sprites!.other!.officialArtwork!.frontDefault!,
              height: 150,
              width: 150,
            ))
            /* Positioned(
              bottom: 1,
              right: 1,
              child: Image.network(
                pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                fit: BoxFit.fill,
                height: 70,
                width: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${pokemon.id.toString()}",
                ),
                Text(
                  pokemon.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.types!
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            e.type!.name!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: getBackGroundColor2(
                              pokemon.types![0].type!.name!,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ) */
          ],
        ),
      ),
    );
  }
}
