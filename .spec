# つくる

ブログ

# DB構成

- Entry
  - 記事を構成するモデル
  - body_md markdownで記述されたデータが入る。markdownで記述したいのでそうする。**実際には描画されない**
  - body markdown to htmlされたデータが入る。実際に描画される部分
  - author Userモデルと紐づく
  - tag(必要かもしれないあとで考える)
  - title タイトルを表す
  - updated_at 最終変更された日付を表す

- User
  - 記事を投稿したり編集したり消したりできる概念
  - email
  - password_confrim
