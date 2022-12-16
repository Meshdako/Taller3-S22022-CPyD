import 'dart:ui';

const Map<String, Color> pokemonTypeMap = {
  "normal": Color(0xFFA8A77A),
	"fire": Color(0xFFEE8130),
	"water": Color(0xFF6390F0),
	"electric": Color(0xFFF7D02C),
	"grass": Color(0xFF7AC74C),
	"ice": Color(0xFF96D9D6),
	"fighting": Color(0xFFC22E28),
	"poison": Color(0xFFA33EA1),
	"ground": Color(0xFFE2BF65),
	"flying": Color(0xFFA98FF3),
	"psychic": Color(0xFFF95587),
	"bug": Color(0xFFA6B91A),
	"rock": Color(0xFFB6A136),
	"ghost": Color(0xFF735797),
	"dragon": Color(0xFF6F35FC),
	"dark": Color(0xFF705746),
	"steel": Color(0xFFB7B7CE),
	"fairy": Color(0xFFD685AD),
};



const Map<String, Color> pokemonTypeMap2 = {
  "grass": Color.fromARGB(255, 180, 233, 156),
  "poison": Color.fromARGB(255, 218, 129, 203),
  "fire": Color.fromARGB(255, 248, 135, 135),
  "flying": Color.fromARGB(255, 164, 136, 247),
  "bug": Color.fromARGB(255, 89, 245, 208),
  "water": Color.fromARGB(255, 162, 214, 252),
  "normal": Color.fromARGB(255, 236, 236, 147),
  "ground": Color.fromARGB(255, 245, 227, 162),
  "fairy": Color.fromARGB(255, 243, 143, 250),
  "electric": Color.fromARGB(255, 248, 241, 197),
  "fighting": Color.fromARGB(255, 250, 113, 85),
  "psychic": Color.fromARGB(255, 240, 153, 198),
  "rock": Color.fromARGB(255, 236, 198, 29),
  "steel": Color.fromARGB(255, 140, 133, 241),
  "ice": Color.fromARGB(255, 101, 224, 243),
  "ghost": Color.fromARGB(255, 176, 19, 238),
  "dragon": Color.fromARGB(208, 146, 102, 247),
  "dark": Color.fromARGB(255, 243, 115, 42),
};

Color getBackGroundColor(String type) {
  return pokemonTypeMap[type] ?? const Color(0xFFA8A77A);
}


Color getBackGroundColor2(String type) {
  return pokemonTypeMap2[type] ?? const Color.fromARGB(255, 142, 199, 114);
}
