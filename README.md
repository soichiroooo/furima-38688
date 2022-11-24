必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。
 ログイン状態の場合のみ、商品出品ページへ遷移できること。
 ログアウト状態の場合は、商品出品ページへ遷移しようとすると、ログインページへ遷移すること。
 商品画像を1枚つけることが必須であること。
 商品名が必須であること。
 商品の説明が必須であること。
 カテゴリーの情報が必須であること。
 カテゴリーは、「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目が表示されること（--- は初期値として設定すること）。
 商品の状態の情報が必須であること。
 商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目が表示されること（--- は初期値として設定すること）。
 配送料の負担の情報が必須であること。
 配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目が表示されること（--- は初期値として設定すること）。
 発送元の地域の情報が必須であること。
 発送元の地域は、「---」と47都道府県の合計48項目が表示されること（--- は初期値として設定すること）。
 発送までの日数の情報が必須であること。
 発送までの日数は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目が表示されること（--- は初期値として設定すること）。
 価格の情報が必須であること。
 価格は、¥300~¥9,999,999の間のみ保存可能であること。
 価格は半角数値のみ保存可能であること。
 入力された価格によって、販売手数料や販売利益の表示が変わること。
 販売手数料と販売利益は、小数点以下を切り捨てて表示すること。
 出品が完了したら、トップページに遷移すること。
 エラーハンドリングができること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）。
 エラーハンドリングによって出品ページに戻った場合でも、入力済みの項目（商品画像・販売手数料・販売利益以外）は消えないこと。
 エラーハンドリングの際、重複したエラーメッセージが表示されないこと。
補足情報
配布しているビューファイルのname属性などは、初期値として「hoge」と設定しているため、実装する際には自身のデータベース設計に合わせて変更すること。
カテゴリー選択など、基本的に変更されないデータを取り扱う際は、以下のカリキュラムを参考にして、ActiveHashを使用すること。
最終課題補足カリキュラム Lesson1 「カテゴリーの選択を工夫しよう」
画像投稿の実装は、ActiveStorageを使用すること（画像の複数枚投稿は追加実装となるため、この段階では、画像1枚での出品機能を実装する）。
販売手数料や販売利益の計算は、JavaScriptを使用して実装すること。
出品に失敗した場合に、画像・販売手数料・販売利益の欄が空欄になることは問題ない。
販売手数料と販売利益におけるカンマでの区切り表示は必須ではない。
注意事項
機能毎に、commitとpushを行うこと。
配布されたビューファイルに最初からコメントアウトで指示などが記されている場合があるが、それらは機能を実装できた時点で削除すること。
販売手数料や販売利益の表示機能実装の際に、jQuery等のライブラリは使用しないこと。
このタスクに関係のないアクションやメソッドなどの記述は行わない（プルリクエストにて、適切な差分が表示されない原因となるため）。
メンターにコードレビューを依頼すること。
機能の様子はGyazo GIFを用いて、テストコードが通っている様子はGyazoを用いて撮影し、それぞれのリンクをプルリクエストへ添付すること。
Gyazoのリンクを添付する際は、何を撮影したGyazoのリンクか分かるように、リンクの前に説明を記載すること。
コードレビューを依頼する前に、Rubocopを実行すること。
コードレビューを依頼する際は、テストコードを書き終わってから依頼すること（テストコードの含まれていないレビューは対応しません。実際の開発現場でも同様の対応であるためです）。
プルリクエストには、「What」と「Why」を記述すること（「What」と「Why」の記載されていないレビューは対応しません。実際の開発現場でも同様の対応であるためです）。
LGTMが出るまでマージしないこと。
LGTMが出る前に他の実装へ着手することは、推奨しない（Gitにおける複雑なコンフリクト等を引き起こす可能性があるためです）。


# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| date_of_birth      | date     | null: false               |

has_many :items
has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| price              | integer     | null: false                    |
| explanation        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| shipping_charge_id | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| shipping_date_id   | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

belongs_to :user
has_one :purchase

## purchases テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    |
| prefecture_id   | integer     | null: false                    |
| city            | string      | null: false                    |
| address_line    | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| purchase        | references  | null: false, foreign_key: true |

belongs_to :purchase