class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCategries = <Category>[
  const Category('icons/guitar-icon.png', 'Guitares', 'guitar'),
  const Category('icons/bass-icon.png', 'Basses', 'bass'),
  const Category('icons/strings-icon.png', 'Cordes', 'strings'),
  const Category('icons/trumpet-icon.png', 'Trompettes', 'trumpet'),
  const Category('icons/drum-icon.png', 'Percussions', 'drum'),
  const Category('icons/keyboard-icon.png', 'Pianos', 'keyboard'),
  const Category('icons/brass-icon.png', 'Cuivres', 'brass'),
];
