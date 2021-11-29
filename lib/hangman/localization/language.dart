

class English {


  static List<String> letters = List
      .generate(26, (index) => String.fromCharCode(index + 65));


  static List<String> words = List.of([
   'affix',
   'avenue',
   'awkward',
   'boggle',
   'cobweb',
   'cycle',
   'duplex',
   'equip',
   'exodus',
   'funny',
   'galaxy',
   'gossip',
   'icebox',
   'injury',
   'jackpot',
   'jelly',
   'joking',
   'joyful',
   'kiosk',
   'lucky',
   'luxury',
   'puppy',
   'scratch',
   'staff',
   'stretch',
  ]).map((e) => e.toUpperCase()).toList();

  static InfoMessage info = InfoMessage(
      'Hey, and welcome to Hangman!',

    ['''
    The objective in hangman is to guess unknown words letter by letter.
    The only lead you have to begin with is the word length, and arbitrary guesses are your
    only option. If you guess a letter correctly, the letter will be confirmed
    to you as a player, and the position of the letter will also be shown.
    Maybe you're able to figure out what the word is mid-game?
    Once you guessed all the correct letter, you've won the game, but wait...
    ''',

    '''
    You have limited attempts, and errors will bring the line-man closer
    and close to his unfortunate destiny under the gallow. Once the line-man
    is fully drawn, you've lost the game. If you guess all the correct letters
    before that may occur, you've won. If you wish to read this tutorial
    again, simply click the return-button.
    ''',

    '''
    This app supports both norwegian and english. If you wish to alter
    the language, you may achieve this in system-settings. You're currently
    reading this tutorial in english because the application loaded with
    english preferences.
    '''].map((e) => e.replaceAll('\n', ''))
  );

  static String playBtnLabel = "Play";

  static String resetButtonLabel = "Reset";

  static String Function(String word) gameOverMessage =
      (word) => 'You have lost. The correct word is \'$word\'.';

  static String victoryMessage = 'You\'ve won. Congratulations!';

}

class Norwegian {


  static List<String> letters = List
      .generate(26, (index) => String.fromCharCode(index + 65))
      .followedBy(['Æ', 'Ø', 'Å'])
      .toList();

  static List<String> words = List.of([
    'feste',
    'pinlig',
    'syklus',
    'avvise',
    'tosidig',
    'utruste',
    'morsom',
    'galakse',
    'sladder',
    'skade',
    'tuller',
    'kajakk',
    'kiosk',
    'lengder',
    'heldig',
    'luksus',
    'pyjamas',
    'valp',
    'ripe',
  ]).map((e) => e.toUpperCase()).toList();

  static InfoMessage info = InfoMessage(
      'Hei og velkommen til Hangman!',
      
      ['''
    Målet med hangman er å gjette ukjente ord, og du gjetter bokstav for bokstav.
    Til å begynne med vet du kun antall bokstaver, og her må du bare prøve tilfeldig.
    Gjetter du en bokstav som finnes i ordet blir dette bekrefet til deg som spiller,
    og også plasseringen til bokstaven i ordet. Kanskje du klarer å gjenkjenne
    ordet underveis? Når du har gjettet alle bokstaven har du vunnet, men vent...''',

        '''Du har ikke uendelig med gjetninger. Gjetter du feil møter strekmannen
    skjebnen under galgen mer og mer. Når strekmannen er ferdig tegnet har
    du tapt spillet. Har du derimot gjettet alle bokstaver før det skjer
    vinner du. Trenger du litt repetisjon kan du navigere deg hit igjen med
    tilbake-knappen.''',

        '''Denne appen støtter Norsk og Engelsk. Ønsker du å endre språket
    gjøres dette fra system-instillinger. Du leser denne velkomsten på
    norsk ettersom appen er lastet inn med norske instllinger.
    '''].map((e) => e.replaceAll(RegExp('[\r\n]'), ''))
  );

  static String playBtnLabel = "Spill";

  static String resetButtonLabel = "Nullstill";

  static String Function(String word) gameOverMessage =
      (word) => 'Du tapte. Riktig ord var \'$word\'.';

  static String victoryMessage = 'Du vant. Gratulerer!';
}

class InfoMessage{
  String header;
  Iterable<String> description;

  InfoMessage(this.header,this.description);
}