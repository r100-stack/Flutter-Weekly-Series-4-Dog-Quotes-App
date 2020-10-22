class QuoteUtils {
  static final List<String> _quotes = [
    'Don\'t get scared of anything',
    'Nothing is impossible',
    'Dream big',
    'Ignore naysayers',
    'Forgive people',
    'Work hard',
    'Don\'t give up',
    'Don\'t stop until you achieve it',
    'Losing is for losers',
    'Winning is for winners',
    'Do you want to quit now? HELL NO!',
    'Think about what life would be if you achieve it. To get that, WORK HARD!',
    'Want money, ferrari and a lambo? Then get up and work for it!',
    'Ain\'t nobody think less of you',
    'You got this',
    'Want to be successful? Then give me a dog treat.',
    'If you slack off, I\'m telling Arnold Schwarzenegger. He\'s gonna beat you up',
    'When life gives you lemons, make orange juice, cuz... who cares',
    'Fear these canines you puny little human',
    'Work hard. Don\'t make me ask twice, or else... RAWRR-BARK-BARK'
  ];

  static List<int> _indices = List.generate(_quotes.length, (index) => index)..shuffle();
  static int _counter = 0;

  static String getRandomQuote() {
    if (_counter == _indices.length) {
      _indices.shuffle();
      _counter = 0;
    }

    return _quotes[_indices[_counter++]];
  }
}