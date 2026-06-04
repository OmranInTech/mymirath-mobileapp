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
  // ================= GENERAL FOUNDATIONS =================
  FatwaItem(
    title: "Divine Mandate of Fara'id",
    type: "Rule",
    content:
        "The Islamic inheritance framework (Ilm al-Fara'id) consists of divinely determined shares (Nass) established directly by Allah. Jurisprudential consensus (Ijma) dictates that these allocations are fixed legal bounds that cannot be altered, compromised, or overridden by personal discretion or modern custom.",
  ),

  FatwaItem(
    title: "The Core Quranic Mandate",
    type: "Quran",
    content:
        "Allah commands you regarding your children: for the male, a share equal to that of two females... These are the limits set by Allah, and whoever obeys Allah and His Messenger will be admitted by Him to gardens under which rivers flow.\" (Surah An-Nisa, 4:11-13)",
  ),

  FatwaItem(
    title: "Imam al-Bukhari & Muslim Canonical Hadith",
    type: "Hadith",
    content:
        "The Prophet Muhammad ﷺ said: 'Give the fixed shares (al-Fara'id) to those who are entitled to them, and what remains goes to the closest male relative.' Authenticated under rigorous consensus by Imam al-Bukhari (Sahih al-Bukhari, Book 85, Hadith 1) and Imam Muslim (Sahih Muslim, Book 23, Hadith 2).",
  ),

  // ================= SECONDARY MEANINGS & ORDER OF EXECUTION =================
  FatwaItem(
    title: "Legal Meaning & Fiqh Implication",
    type: "Rule",
    content:
        "According to classical jurisprudential schools, this primary text establishes the exact systemic order of asset division: First, settle all valid debts and funeral expenses. Second, distribute precise fractional cuts to the primary fixed sharers (Ashab al-Fara'id). Third, route the remaining residue directly to the paternal agnates (Asabah).",
  ),

  FatwaItem(
    title: "The Principle of Estate Priorities",
    type: "Rule",
    content:
        "Imam Shafi'i and other major jurists emphasize that the rights attached to a deceased's estate must follow a strict timeline before any inheritance is calculated: 1. Funeral and burial costs, 2. Secured debts (e.g., mortgages or collateralized loans), 3. Unsecured debts (including unpaid Mahr and unfulfilled Zakat), 4. Valid testaments/wills (Wasiyyah), up to a maximum of one-third of the remaining estate.",
  ),

  // ================= THE ONE-THIRD LIMIT RULE =================
  FatwaItem(
    title: "Imam Malik on the One-Third Limit (Wasiyyah)",
    type: "Hadith",
    content:
        "Sa'd bin Abi Waqqas narrated that the Prophet Muhammad ﷺ restricted testamentary dynamic allocation, saying: 'One third, and yet one third is too much. It is better for you to leave your inheritors wealthy than to leave them poor, begging from people.' Authenticated in Imam Malik's Muwatta (Book 36, Hadith 4). This firmly establishes that no more than 33.3% of an estate can be willed to non-heirs.",
  ),

  FatwaItem(
    title: "No Wills Allowed for Legal Heirs",
    type: "Rule",
    content:
        "The Prophet Muhammad ﷺ explicitly stated during the Farewell Pilgrimage: 'Allah has given each right-owner their due right, so there is no testamentary will (Wasiyyah) permitted for an existing legal heir.' (Sunan Abi Dawud, Book 18, Hadith 12). Fiqh consensus states that a person cannot use a will to give an heir extra assets beyond their fixed Shariah fraction unless all other heirs unanimously agree after the death occurs.",
  ),

  // ================= MATHEMATICAL ADJUSTMENT LAWS =================
  FatwaItem(
    title: "The Law of Proportionate Reduction (Al-Awal)",
    type: "Rule",
    content:
        "When the total fractions allocated to primary fixed sharers exceed the total available estate (greater than 1.0), classical Islamic math invokes 'Al-Awal' (Proportionate Reduction). First initiated by the Caliph Umar ibn al-Khattab and verified by Zayd ibn Thabit, this adjustment expands the mathematical denominator to decrease everyone's shares proportionately, protecting the rights of all eligible family members without completely excluding anyone.",
  ),

  FatwaItem(
    title: "The Law of Return Allocation (Al-Radd)",
    type: "Rule",
    content:
        "Conversely, if the fixed fractions sum to less than 1.0 and there are no residual paternal relatives (Asabah) to absorb the remainder, the leftover assets are redistributed back to the primary fixed sharers in proportion to their initial fractions. The majority of Sunni legal schools rule that this return applies to all blood relatives, but explicitly excludes a surviving spouse from receiving a portion of the remainder.",
  ),

  // ================= WARNINGS AND BLOCKING CRITERIA =================
  FatwaItem(
    title: "Legal Blocking and Exclusion Mechanics",
    type: "Rule",
    content:
        "In Islamic law, certain relatives fully block others from inheriting based on proximity. For example, a surviving direct son completely excludes brothers, sisters, nephews, and uncles from receiving any fixed or residual shares. This systematic prioritization ensures that the closest dependent core family unit is permanently insulated from financial destabilization.",
  ),

  FatwaItem(
    title: "Warning: Violation of Divine Limits",
    type: "Warning",
    content:
        "Denying an heir their legitimate Shariah-allocated portion or deliberately manipulating familial distribution lines constitutes a major transgression (Kabirah). Allah explicitly states in Surah An-Nisa (4:14) that whoever violates these specific boundaries will be cast into enduring, humiliating punishment.",
  ),

  // ================= APP SCOPE LIMITATIONS =================
  FatwaItem(
    title: "Jurisprudential Scope & Limitations",
    type: "Rule",
    content:
        "This dynamic logic engine calculates standard asset divisions based on deterministic consensus frameworks. Complex corporate holdings, modern structural debt instruments, or disputed familial parentage cases require deep, direct judicial review by a qualified Islamic court or authorized Mufti.",
  ),
];