

class Animal {
  final String name;
  final String food;
  final String habitat;
  final String lifespan;
  final String description;

  Animal({
    required this.name,
    required this.food,
    required this.habitat,
    required this.lifespan,
    required this.description,
  });
}

// Sample data for each animal
List<Animal> animals = [
  Animal(
      name: 'Dog',
      food: 'Dog food, meat',
      habitat: 'Domestic, various environments',
      lifespan: "10 Year",
      description:
      'Dogs are domesticated mammals, not natural wild animals. They were originally bred from wolves. They have been bred by humans for a long time, and were the first animals ever to be domesticated.'
  ),
  Animal(
      name: 'Cat',
      food: 'Cat food, meat',
      habitat: 'Domestic, various environments',
      lifespan: "15 Year",
      description:
      'Cats are domesticated mammals, not natural wild animals like dogs. They were originally bred from wild cats in the Near East around 7500 BC.'
  ),
  Animal(
      name: 'Sparrow',
      food: 'Seeds, insects',
      habitat: 'Urban areas, grasslands, forests',
      lifespan: "3 Year",
      description:
      'Sparrows are small, plump, brown-grey birds with short tails and stubby, powerful beaks. They are found throughout the world.'
  ),
  Animal(
      name: 'Pigeon',
      food: 'Seeds, grains',
      habitat: 'Urban areas, cities',
      lifespan: "5 Year",
      description:
      'Pigeons are stout-bodied birds with short necks, and short, slender bills with fleshy ceres. They primarily feed on seeds, fruits, and plants.'
  ),
  Animal(
      name: 'Octopus',
      food: 'Fish, crustaceans, mollusks',
      habitat: 'Ocean, reefs',
      lifespan: "1-2 years",
      description:
      'Octopuses are soft-bodied, eight-limbed mollusks of the order Octopoda. They are found in every ocean basin, from the intertidal zone to depths of more than 7,000 meters.'
  ),
  Animal(
      name: 'Rhino',
      food: 'Grasses, leaves, fruits',
      habitat: 'Grasslands, savannas',
      lifespan: "35-50 years",
      description:
      'Rhinos are large mammals known for their horns and tough, armored skin. They are found in parts of Africa and Asia. There are five species of rhinos: white, black, Indian, Javan, and Sumatran.'
  ),
  Animal(
      name: 'Leopard',
      food: 'Deer, antelope, small mammals',
      habitat: 'Forests, grasslands, mountains',
      lifespan: "12-17 years",
      description:
      'Leopards are large, solitary cats that are native to Africa and parts of Asia. They are famous for their strength, agility, and unique spotted coat.'
  ),
  Animal(
      name: 'Lion',
      food: 'Buffalo, zebra, wildebeest',
      habitat: 'Grasslands, savannas',
      lifespan: "10-14 year ",
      description:
      'Lions are large, carnivorous cats that are native to Africa. They are known for their majestic appearance, loud roar, and social behavior.'
  ),
  Animal(
      name: 'Jaguar',
      food: 'Deer, peccaries, capybaras',
      habitat: 'Forests, swamps, grasslands',
      lifespan: "12-15 years",
      description:
      'Jaguars are large, powerful cats native to the Americas. They are known for their distinctive spotted coat and strong jaws.'
  ),
];
