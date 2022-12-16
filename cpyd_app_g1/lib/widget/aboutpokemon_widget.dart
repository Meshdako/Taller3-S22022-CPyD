import 'package:flutter/material.dart';
import 'package:cpyd_app_g1/model/pokemondetail_model.dart';
import '../constant.dart';

class AboutPokemonWidget extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const AboutPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Image(
              image: AssetImage('lib/assets/Icons/Vector-1.png'),
              ),
            Image(
              image: AssetImage('lib/assets/Icons/whitescreen.png'),
              width: 25,
              height: 20,
              ),
            Image(
              image: AssetImage('lib/assets/Icons/Vector.png'),
              ),
            Image(
              image: AssetImage('lib/assets/Icons/whitescreen.png'),
              width: 25,
              height: 20,
              ),
        ],),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Altura'),
            SizedBox(height: 20),
            Text('Peso'),
            SizedBox(height: 20),
            Text('Habilidad'),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${(pokemon.height! / 10).toString()} m",
              ),
              const SizedBox(height: 20),
              Text(
                "${(pokemon.weight! / 10).toString()} Kg",
              ),
              const SizedBox(height: 20),
              Wrap(
                children: pokemon.abilities!
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: getBackGroundColor(
                            pokemon.types![0].type!.name!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          e.ability!.name!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              ), 
            ],
          ),
        ),
      ],
    );
  }
}
