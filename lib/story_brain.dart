import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  Story getStory() {
    return _storyData[_storyNumber];
  }

  Choice getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  Choice getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    final Story currentStory = getStory();
    final Choice choiceMade =
        choiceNumber == 1 ? currentStory.choice1 : currentStory.choice2;

    // restarts, if such point is reached (where nextStoryNumber = 0).
    _storyNumber = choiceMade.nextStoryNumber;
  }

  bool nextChoiceWillSurelyRestartStory() {
    final Story currentStory = getStory();
    return currentStory.choice1.action == ChoiceAction.Restart &&
        currentStory.choice2.action == ChoiceAction.Restart;
  }
}

enum ChoiceAction { Next, Restart }

class Choice {
  String choiceText;
  ChoiceAction action;
  int nextStoryNumber;

  Choice({
    this.choiceText,
    this.action = ChoiceAction.Next,
    this.nextStoryNumber = 0,
  });
}

List<Story> _storyData = [
  Story(
    storyTitle:
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
    choice1: Choice(
      choiceText: 'I\'ll hop in. Thanks for the help!',
      nextStoryNumber: 2,
    ),
    choice2: Choice(
      choiceText: 'Better ask him if he\'s a murderer first.',
      nextStoryNumber: 1,
    ),
  ),
  Story(
    storyTitle: 'He nods slowly, unphased by the question.',
    choice1: Choice(
      choiceText: 'At least he\'s honest. I\'ll climb in.',
      nextStoryNumber: 2,
    ),
    choice2: Choice(
      choiceText: 'Wait, I know how to change a tire.',
      nextStoryNumber: 3,
    ),
  ),
  Story(
    storyTitle:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
    choice1: Choice(
      choiceText: 'I love Elton John! Hand him the cassette tape.',
      nextStoryNumber: 5,
    ),
    choice2: Choice(
      choiceText: 'It\'s him or me! You take the knife and stab him.',
      nextStoryNumber: 4,
    ),
  ),
  Story(
    storyTitle:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
    choice1: Choice(
      choiceText: 'Restart',
      action: ChoiceAction.Restart,
    ),
    choice2: Choice(
      choiceText: '',
      action: ChoiceAction.Restart,
    ),
  ),
  Story(
    storyTitle:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    choice1: Choice(
      choiceText: 'Restart',
      action: ChoiceAction.Restart,
    ),
    choice2: Choice(
      choiceText: '',
      action: ChoiceAction.Restart,
    ),
  ),
  Story(
    storyTitle:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
    choice1: Choice(
      choiceText: 'Restart',
      action: ChoiceAction.Restart,
    ),
    choice2: Choice(
      choiceText: '',
      action: ChoiceAction.Restart,
    ),
  ),
];
