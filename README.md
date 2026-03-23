# BYB-APP

## Bybanx — Web3 文化創意產業平台

> **BYB2025.COM** | 文化上鏈 · 全球流通 · 共創價值

---

## 專案簡介

**Bybanx** 是一個基於 Web3 技術的文化創意產業應用平台，透過現實文化產業資產上鏈孵化機制，讓真實資產實現數字化、全球化和可流通化。

- 👤 **用戶角色**：消費者 + 投資者 + 治理者
- 🏢 **企業賦能**：低成本融資 + 品牌升級 + 全球曝光
- 🔗 **核心技術**：NFT 資產上鏈、DAO 去中心化治理、DeFi 收益機制

---

## 功能模塊

| 模塊 | 說明 |
|------|------|
| 🏠 **首頁 Dashboard** | 資產總覽、市場走勢圖、熱門 NFT、IP 孵化精選 |
| 🛒 **NFT 市場** | 文化藝術 NFT 瀏覽、購買、競拍、排行榜 |
| 💼 **我的資產** | 代幣持倉、NFT 收藏、收益記錄、資產分佈圖 |
| 🗳️ **DAO 治理** | 社區提案、投票決策、治理代幣、投票記錄 |
| 🚀 **IP 孵化** | 文化 IP 上鏈申請、融資進度追蹤、支持參與 |
| 👤 **個人中心** | 錢包連接、KYC 認證、帳戶設置、邀請獎勵 |

---

## 技術棧

- **框架**：Flutter 3.35.4 / Dart 3.9.2
- **狀態管理**：Provider
- **圖表**：fl_chart
- **字體**：Google Fonts（Playfair Display + Inter）
- **本地存儲**：shared_preferences
- **HTTP 請求**：http
- **平台支持**：Android / iOS / Web

---

## 設計系統

採用**極簡高端精緻風格**：

- 🎨 主色：純白 `#FFFFFF` + 軟金 `#C9A84C` + 碳黑 `#2C3E50`
- 🔤 標題字體：Playfair Display（高雅襯線體）
- 📝 正文字體：Inter（現代無襯線體）
- 💫 風格：奢華金融美學 · 大量留白 · 細膩陰影

---

## 快速開始

### 環境需求

- Flutter SDK `>=3.0.0 <4.0.0`
- Dart SDK `>=3.0.0 <4.0.0`
- Android Studio / VS Code
- Android SDK API Level 35+

### 安裝與運行

```bash
# 克隆倉庫
git clone https://github.com/DUNHUA2025/BYB-APP.git
cd BYB-APP

# 安裝依賴
flutter pub get

# 運行（開發模式）
flutter run

# 構建 Web 預覽
flutter build web --release

# 構建 Android APK
flutter build apk --release

# 構建 Android AAB（Google Play）
flutter build appbundle --release
```

---

## 項目結構

```
lib/
├── main.dart                    # 主程式入口 + 底部導航
├── theme/
│   └── app_theme.dart           # 全局主題 & 色彩系統
├── data/
│   └── mock_data.dart           # NFT / 代幣 / DAO / IP 數據
├── widgets/
│   └── common_widgets.dart      # 通用組件（按鈕、卡片、徽章）
└── screens/
    ├── home_screen.dart         # 首頁 Dashboard
    ├── market_screen.dart       # NFT 市場
    ├── assets_screen.dart       # 我的資產
    ├── governance_screen.dart   # DAO 治理
    ├── incubator_screen.dart    # IP 孵化
    └── profile_screen.dart     # 個人中心
```

---

## Android 構建資訊

| 項目 | 詳情 |
|------|------|
| **Application ID** | `com.bybanxculture.chain` |
| **Min SDK** | Android 5.0 (API 21) |
| **Target SDK** | Android 15 (API 35) |
| **版本** | 1.0.0 (Build 1) |
| **簽名** | Release Keystore 簽名 |

> ⚠️ **安全提示**：`release-key.jks` 和 `key.properties` 已加入 `.gitignore`，請勿提交至版本庫。

---

## 相關連結

- 🌐 官方網站：[BYB2025.COM](https://byb2025.com)
- 📱 Flutter 文檔：[flutter.dev](https://docs.flutter.dev/)
- 🔗 pub.dev：[pub.dev](https://pub.dev)

---

## 版權聲明

© 2025 Bybanx Culture. All rights reserved.  
**BYB2025.COM** — 文化上鏈，讓世界看見你的價值。
