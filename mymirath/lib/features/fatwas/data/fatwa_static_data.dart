class FatwaItem {
  final String title;
  final String type; // Quran / Hadith / Rule / Warning
  final String content;

  const FatwaItem({
    required this.title,
    required this.type,
    required this.content,
  });
}

const List<FatwaItem> fatwas = [
  FatwaItem(
    title: "Importance of Inheritance in Islam",
    type: "Rule",
    content:
        "Islamic inheritance (Faraid) is a divinely fixed system established by Allah. It is not optional or flexible; it must be distributed according to Quranic law.",
  ),

  FatwaItem(
    title: "Quran Reference",
    type: "Quran",
    content:
        "Allah says in Surah An-Nisa (4:11): 'Allah commands you regarding your children: for the male, a share equal to that of two females...'",
  ),

  FatwaItem(
    title: "Hadith on Inheritance",
    type: "Hadith",
    content:
        "The Prophet Muhammad ﷺ said: 'Give the fixed shares to those who are entitled to them, and what remains goes to the closest male relative.' (Sahih Bukhari)",
  ),

  FatwaItem(
    title: "Warning Against Wrong Distribution",
    type: "Warning",
    content:
        "Changing inheritance shares based on personal preference is a major sin in Islam, as it violates Allah’s ordained law.",
  ),

  FatwaItem(
    title: "Purpose of This App",
    type: "Rule",
    content:
        "This calculator is designed to assist understanding of Islamic inheritance, not to replace scholarly judgment in complex cases.",
  ),
];