class MemberInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final String gurl;

  MemberInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.gurl,
  });
}

List<MemberInfo> member = [
  MemberInfo(1,
      name: 'Pavika Chaudhary',
      iconImage: 'assets/pavika.png',
      description: "fiji ifijfi ifuj",
      gurl: "hh"),
  MemberInfo(2,
      name: 'Naina Kumari',
      iconImage: 'assets/naina.png',
      description: "fiji ifijfi ifuj",
      gurl: "nn"),
  MemberInfo(3,
      name: 'Shruti Nanda',
      iconImage: 'assets/shruti.png',
      description: "fiji ifijfi ifuj",
      gurl: "https://github.com/Saggittarius-A"),
];
