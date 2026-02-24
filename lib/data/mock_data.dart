// Mock data for Bybanx Culture platform

class NftItem {
  final String id;
  final String title;
  final String artist;
  final String category;
  final double price;
  final String currency;
  final String imageUrl;
  final bool isHot;
  final double change24h;
  final int edition;
  final int totalEditions;

  const NftItem({
    required this.id,
    required this.title,
    required this.artist,
    required this.category,
    required this.price,
    required this.currency,
    required this.imageUrl,
    this.isHot = false,
    this.change24h = 0,
    this.edition = 1,
    this.totalEditions = 100,
  });
}

class TokenAsset {
  final String symbol;
  final String name;
  final double balance;
  final double valueUsd;
  final double change24h;
  final String iconUrl;

  const TokenAsset({
    required this.symbol,
    required this.name,
    required this.balance,
    required this.valueUsd,
    required this.change24h,
    required this.iconUrl,
  });
}

class DaoProposal {
  final String id;
  final String title;
  final String description;
  final String category;
  final int votesFor;
  final int votesAgainst;
  final DateTime endDate;
  final String status;

  const DaoProposal({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.votesFor,
    required this.votesAgainst,
    required this.endDate,
    required this.status,
  });

  double get approvalRate {
    final total = votesFor + votesAgainst;
    if (total == 0) return 0;
    return votesFor / total;
  }
}

class IpProject {
  final String id;
  final String name;
  final String category;
  final String description;
  final double fundingGoal;
  final double fundingRaised;
  final int backers;
  final int daysLeft;
  final String imageUrl;
  final String stage;

  const IpProject({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.fundingGoal,
    required this.fundingRaised,
    required this.backers,
    required this.daysLeft,
    required this.imageUrl,
    required this.stage,
  });

  double get fundingProgress => fundingRaised / fundingGoal;
}

// ── Mock Data ──────────────────────────────────────────────

final List<NftItem> mockNfts = [
  NftItem(
    id: '1',
    title: '東方晨曦',
    artist: '張偉明',
    category: '數字藝術',
    price: 2.5,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?w=400',
    isHot: true,
    change24h: 12.4,
    edition: 1,
    totalEditions: 50,
  ),
  NftItem(
    id: '2',
    title: '絲路遺韻',
    artist: '李曉藝',
    category: '文化遺產',
    price: 5.8,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1578301978693-85fa9c0320b9?w=400',
    isHot: false,
    change24h: -3.2,
    edition: 3,
    totalEditions: 30,
  ),
  NftItem(
    id: '3',
    title: '霓虹傳說',
    artist: 'CyberArt Studio',
    category: '流行文化',
    price: 1.2,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=400',
    isHot: true,
    change24h: 28.7,
    edition: 12,
    totalEditions: 200,
  ),
  NftItem(
    id: '4',
    title: '古韻新聲',
    artist: '陳思遠',
    category: '音樂 NFT',
    price: 3.3,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=400',
    isHot: false,
    change24h: 5.1,
    edition: 7,
    totalEditions: 100,
  ),
  NftItem(
    id: '5',
    title: '星際文明',
    artist: 'Nova Digital',
    category: '科幻藝術',
    price: 8.0,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?w=400',
    isHot: true,
    change24h: 41.2,
    edition: 1,
    totalEditions: 10,
  ),
  NftItem(
    id: '6',
    title: '茶道意境',
    artist: '王靜雅',
    category: '生活美學',
    price: 0.8,
    currency: 'BYB',
    imageUrl: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400',
    isHot: false,
    change24h: 2.3,
    edition: 22,
    totalEditions: 88,
  ),
];

final List<TokenAsset> mockTokens = [
  const TokenAsset(
    symbol: 'BYB',
    name: 'Bybanx Token',
    balance: 12580.00,
    valueUsd: 8342.50,
    change24h: 6.8,
    iconUrl: '',
  ),
  const TokenAsset(
    symbol: 'CIP',
    name: 'Culture IP Token',
    balance: 3200.00,
    valueUsd: 2048.00,
    change24h: -2.3,
    iconUrl: '',
  ),
  const TokenAsset(
    symbol: 'ART',
    name: 'ArtChain Token',
    balance: 580.50,
    valueUsd: 1421.23,
    change24h: 14.5,
    iconUrl: '',
  ),
  const TokenAsset(
    symbol: 'DAO',
    name: 'Governance Token',
    balance: 9000.00,
    valueUsd: 720.00,
    change24h: 0.5,
    iconUrl: '',
  ),
];

final List<DaoProposal> mockProposals = [
  DaoProposal(
    id: 'P001',
    title: '增加文化遺產 NFT 系列鑄造上限',
    description: '提議將文化遺產類別 NFT 每季度鑄造上限從 500 件提升至 1000 件，以滿足市場需求並擴大平台文化影響力。',
    category: '市場政策',
    votesFor: 8420,
    votesAgainst: 1230,
    endDate: DateTime.now().add(const Duration(days: 5)),
    status: 'active',
  ),
  DaoProposal(
    id: 'P002',
    title: '引入跨鏈橋接支持 ETH 生態',
    description: '建立 Bybanx 與以太坊生態的跨鏈橋接機制，讓用戶可以無縫在兩條鏈之間轉移資產，提升平台互通性。',
    category: '技術升級',
    votesFor: 6750,
    votesAgainst: 3100,
    endDate: DateTime.now().add(const Duration(days: 12)),
    status: 'active',
  ),
  DaoProposal(
    id: 'P003',
    title: '設立文化 IP 孵化基金',
    description: '從平台收益中抽取 5% 成立專項孵化基金，用於支持優質文化 IP 項目的早期發展與推廣。',
    category: '基金管理',
    votesFor: 11200,
    votesAgainst: 890,
    endDate: DateTime.now().subtract(const Duration(days: 2)),
    status: 'passed',
  ),
];

final List<IpProject> mockIpProjects = [
  IpProject(
    id: 'IP001',
    name: '功夫宇宙',
    category: '影視 IP',
    description: '以傳統武術文化為核心，打造元宇宙系列影視 IP，包含短片、動畫及互動遊戲。',
    fundingGoal: 500000,
    fundingRaised: 387500,
    backers: 1240,
    daysLeft: 18,
    imageUrl: 'https://images.unsplash.com/photo-1555597673-b21d5c935865?w=400',
    stage: '孵化中',
  ),
  IpProject(
    id: 'IP002',
    name: '量子音樂廳',
    category: '音樂 IP',
    description: '融合古典音樂與電子音樂的全新 Web3 音樂平台，讓音樂人直接與全球粉絲連結。',
    fundingGoal: 200000,
    fundingRaised: 210000,
    backers: 680,
    daysLeft: 0,
    imageUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
    stage: '已達標',
  ),
  IpProject(
    id: 'IP003',
    name: '東方漫宇宙',
    category: '漫畫 IP',
    description: '以中國神話與現代科幻結合，創作系列漫畫 NFT，構建完整的故事宇宙體系。',
    fundingGoal: 350000,
    fundingRaised: 98000,
    backers: 342,
    daysLeft: 45,
    imageUrl: 'https://images.unsplash.com/photo-1601513445506-2ab0d4fb4229?w=400',
    stage: '早期融資',
  ),
];
