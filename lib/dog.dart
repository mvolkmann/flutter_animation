class Dog {
  final String breed;
  final String name;
  final String photoFileName;
  //boo _like = false;
  bool like = false;

  Dog({
    required this.breed,
    required this.name,
    required this.photoFileName,
  });
}

var initialDogs = <Dog>[
  Dog(
    name: 'Maisey',
    breed: 'Treeing Walker Coonhound',
    photoFileName: 'treeing-walker-coonhound.jpg',
  ),
  Dog(
    name: 'Ramsay',
    breed: 'Native American Indian Dog',
    photoFileName: 'native-american-indian-dog.jpg',
  ),
  Dog(
    name: 'Oscar',
    breed: 'German Shorthaired Pointer',
    photoFileName: 'german-shorthaired-pointer.jpg',
  ),
  Dog(
    name: 'Comet',
    breed: 'Whippet',
    photoFileName: 'whippet.jpg',
  ),
];

const gspDescription =
    'The versatile, medium-sized German Shorthaired Pointer is an enthusiastic gundog of all trades who thrives on vigorous exercise, positive training, and a lot of love. GSP people call their aristocratic companions the "perfect pointer." Male German Shorthaired Pointers stand between 23 and 25 inches at the shoulder and weigh anywhere from 55 to 70 pounds; females run smaller. The coat is solid liver (a reddish brown), or liver and white in distinctive patterns. The dark eyes shine with enthusiasm and friendliness. Built to work long days in the field or at the lake, GSPs are known for power, speed, agility, and endurance. Noble and aristocratic are words often used to describe the overall look. GSPs make happy, trainable pets who bond firmly to their family. They are always up for physical activities like running, swimming, organized dog sports, in fact, anything that will burn some of their boundless energy while spending outdoors time with a human buddy.';
const naidDescription =
    'If you saw a Native American Indian Dog, your first instinct might be to think it was a wolf. The Native American Indian Dog is an attractive breed with a wild appearance very similar to their ancestors. These dogs can grow to be fairly large, achieving a maximum weight upwards of 100 lbs., with a light but strong build. Their intelligence is obvious in their bright, almond-shaped eyes which range in color from brown to amber. Always on the alert, the American Indian Dog’s ears are large and firmly pricked, making sure that it catches every sound that comes its way.';
const twcDescription =
    'A smart, brave, and sensible hunter, the Treeing Walker Coonhound is a genuine American favorite, nicknamed "The People\'s Choice." Don\'t let the name fool you. Walkers are runners and are capable of covering a lot of ground in a hurry. Few things can quicken a coon hunter\'s pulse like the sight of this swift tricolored hound in full stride, the long, muscular legs, the powerful and propulsive hindquarters, and the streamlined frame all working to cover maximum ground with minimum effort. Later, basking in the warmth of a campfire after an honest night\'s work, this sweet-faced hound will look up and stir your soul with his gentle, pleading expression. Mercy, what a pretty picture! No wonder Treeing Walkers are called the People\'s Choice.';
const whippetDescription =
    'The sleek, sweet-faced Whippet, the "Poor Man\'s Racehorse," is lightning quick. He is an amiable, dignified, and gentle soul, but give him something to chase and he\'s all business. The name Whippet is synonymous with streamlined grace. At somewhere between 18 and 22 inches at the shoulder, the Whippet looks like a Greyhound, but smaller. The Whippet exhibits the classic "inverted S" lines of the sighthound. The deep chest and trim waist; a lean head supported by a long, arched neck; and slim but sturdy legs combine in a picture of an agile, fleet-footed athlete. Between bursts of intense pursuit, Whippets love to stretch out and relax for long hours, enjoying the role of a loving, and loved, companion. Whippets like a fenced yard to run in, but they do nicely in cozy apartments to long as they are exercised properly. Another plus for city dwellers: Whippets rarely bark. Despite the breed\'s elegant looks, the Whippet is a robust, low-maintenance dog.';

const breedDescriptions = {
  'German Shorthaired Pointer': gspDescription,
  'Native American Indian Dog': naidDescription,
  'Treeing Walker Coonhound': twcDescription,
  'Whippet': whippetDescription,
};
