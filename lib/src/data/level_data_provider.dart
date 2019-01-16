import 'dart:convert';
import '../models/level.dart';

class LevelDataProvider {
  String test = 'test';

  getAllLevels() {
    final levelData = json.decode(data);

    return levelData;
  }
}

String data = '''{
	"04-001": { "name": "Starry, Starry Night", "secretWord": "moon", "completed": false },
	"04-002": { "name": "The Garden", "secretWord": "weed", "completed": false },
	"04-003": { "name": "Wishing Well", "secretWord": "deep", "completed": false },
	"04-004": { "name": "Precious Spaces", "secretWord": "area", "completed": false },
	"04-005": { "name": "Your Royal Majesty", "secretWord": "duke", "completed": false },
	"04-006": { "name": "Desert Oasis", "secretWord": "sand", "completed": false },
	"04-007": { "name": "Sweet and Spicy", "secretWord": "herb", "completed": false },
	"04-008": { "name": "Keep Out", "secretWord": "gate", "completed": false },
	"04-009": { "name": "Hidden in Plain Sight", "secretWord": "mask", "completed": false },
	"04-010": { "name": "A Simple Trick", "secretWord": "hand", "completed": false },
	"04-011": { "name": "Bright Summer Sun", "secretWord": "burn", "completed": false },
	"04-012": { "name": "Signs of Aging", "secretWord": "time", "completed": false },

	"05-001": { "name": "Tidal Wave", "secretWord": "water", "completed": false },
	"05-002": { "name": "Bicycle Ride", "secretWord": "pedal", "completed": false },
	"05-003": { "name": "Brand New Shoes", "secretWord": "shine", "completed": false },
	"05-004": { "name": "Security", "secretWord": "strap", "completed": false },
	"05-005": { "name": "You Can Fly", "secretWord": "arrow", "completed": false },
	"05-006": { "name": "Sneaky Pete", "secretWord": "creep", "completed": false },
	"05-007": { "name": "It Has Been Noted", "secretWord": "thank", "completed": false },
	"05-008": { "name": "I'll Show You", "secretWord": "prove", "completed": false },
	"05-009": { "name": "Sentimental Value", "secretWord": "price", "completed": false },
	"05-010": { "name": "The Old Swimming Hole", "secretWord": "water", "completed": false },
	"05-011": { "name": "Governing Force", "secretWord": "mayor", "completed": false },
	"05-012": { "name": "Good and Plenty", "secretWord": "ample", "completed": false },

	"06-001": { "name": "Emerald Twilight", "secretWord": "galaxy", "completed": false },
	"06-002": { "name": "Cave In", "secretWord": "depths", "completed": false },
	"06-003": { "name": "A Great Position", "secretWord": "career", "completed": false },
	"06-004": { "name": "Wide Open Spaces", "secretWord": "nature", "completed": false },
	"06-005": { "name": "Hanging Out", "secretWord": "linger", "completed": false },
	"06-006": { "name": "Deep in Thought", "secretWord": "wonder", "completed": false },
	"06-007": { "name": "Singing in the Rain", "secretWord": "chorus", "completed": false },
	"06-008": { "name": "The Prisoners", "secretWord": "marble", "completed": false },
	"06-009": { "name": "Repeat After Me", "secretWord": "script", "completed": false },
	"06-010": { "name": "Arrival", "secretWord": "appear", "completed": false },
	"06-011": { "name": "Strong Medicine", "secretWord": "remedy", "completed": false },
	"06-012": { "name": "An Afternoon Picnic", "secretWord": "basket", "completed": false },

	"07-001": { "name": "Speckle Spackle", "secretWord": "painter", "completed": false },
	"07-002": { "name": "The Sweet Salty Air", "secretWord": "seaside", "completed": false },
	"07-003": { "name": "A Nice Feeling", "secretWord": "texture", "completed": false },
	"07-004": { "name": "A Perfect Union", "secretWord": "wedding", "completed": false },
	"07-005": { "name": "Similarities", "secretWord": "related", "completed": false },
	"07-006": { "name": "Solar Flares", "secretWord": "equinox", "completed": false },
	"07-007": { "name": "Another Way", "secretWord": "passage", "completed": false },
	"07-008": { "name": "Wasted", "secretWord": "rubbish", "completed": false },
	"07-009": { "name": "College Roadtrip", "secretWord": "highway", "completed": false },
	"07-010": { "name": "I Put A Spell On You", "secretWord": "fantasy", "completed": false },
	"07-011": { "name": "Strong Coffee", "secretWord": "grounds", "completed": false },
	"07-012": { "name": "Don't Call It A Comeback", "secretWord": "revival", "completed": false }
}''';
