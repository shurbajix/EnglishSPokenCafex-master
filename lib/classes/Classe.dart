import '../Screens/About us/About-us.dart';
import '../Screens/Gather/Gather.dart';
import '../Screens/Gather_Junior/Gather_Junior.dart';
import '../Screens/Online Giris/Online Giris.dart';
import '../Screens/Socalmedia/SocialMedia.dart';
import '../Screens/Topics/Friday/Friday.dart';
import '../Screens/Topics/JUNIOR1/Junor1.dart';
import '../Screens/Topics/JUNIOR2/Junior2.dart';
import '../Screens/Topics/Juniorlink/juinorlink.dart';
import '../Screens/Topics/Monday/Monday.dart';
import '../Screens/Topics/Thursday/Thursday.dart';
import '../Screens/Topics/Topics.dart';
import '../Screens/Topics/Tuesday/Tuesday.dart';
import '../Screens/Topics/Wednesday/Wednesday.dart';
import '../Screens/Topics/Weekend/Weekend.dart';
import '../Screens/Tureng/Tureng.dart';
import '../Screens/Videos/Videos.dart';

List pages = [
   OnlineG(key: null,),
  const Topics(),
  const Videos(),
  const Turengs(),
  Gathers(),
  Gather_Junior(),
  Aboutus(),
  const SocalMedia(),
];
List imagesd = [
  'images/online.png',
  'images/topics.png',
  'images/videos.png',
  'images/dictionary.png',
  'images/games.png',
  'images/juner_games.png',
  'images/system.png',
  'images/social media.png',
];

List Topices = [
  'images/monday.png',
  'images/tuesday.png',
  'images/wednesday.png',
  'images/thursday.png',
  'images/friday.png',
  'images/weekend.png',
  'images/junior 1.png',
  'images/junior 2.png',
  'images/junior 3.png',
];

class Topicesd {
  String text;
  String whats;
  dynamic imagesd;
  Topicesd({required this.text, required this.whats, required this.imagesd});
}

List Topicelist = [
  const Mondays(
    title: '',
    image: '',
    text: '',
  ),
  const Tuesday(),
  const Wednesday(),
  const Thursday(),
  Friday(),
  const Weekend(),
  Junior1(),
  Junior2(),
  const Juniorlink(),
];

class Topicesdd {
  final dynamic value;

  Topicesdd({required this.value});
}

List videoed = [
  'videos/common mistakes.png',
  'videos/phrasal videos 1.png',
  'videos/phrasal videos 2.png',
  'videos/song with lyrics.png',
  'videos/our channel.png',
];
List<dynamic> linkded = [
  'https://www.youtube.com/playlist?list=PLroY9A3h0zCIY7GmYwqi3xtLwT8Cq5gwA',
  'https://www.youtube.com/playlist?list=PLroY9A3h0zCLxvl9akgJHSwXxWCJ8fW68',
  'https://www.youtube.com/playlist?list=PLroY9A3h0zCKEUFN3SUi4hX6Z_5L_LK6u',
  'https://www.youtube.com/playlist?list=PLroY9A3h0zCJdONYmctToNzV15wG0RKLl',
  'https://www.youtube.com/c/EnglishSpokenCafecom',
];

List GatherJunior = [
  'images/Junior-1-gather.png',
  'images/Junior-2-gather.png',
  'images/Junior-3-gather.png',
];

final List<String> speaklevel = [
  'I can\'t Speak',
  'I can Speak',
  'I Can Speak Fluently',
];
