# Rails5のAPIモードを使ったAPI実装方法（京阪淀屋橋駅【平日・出町柳方面】時刻表を例に）

## 共有すること
① Rails5のAPIモードで、JSONデータを提供するAPIを実装する方法
② CSVで用意した初期データを投入する方法


## 利用する技術
Rails 5

## 活用した情報
京阪電鉄・淀屋橋駅 【平日・出町柳方面】 時刻表の始発〜午前７時台まで
https://www.keihan.co.jp/traffic/station/stationinfo/010.html

## 下準備
時刻表データをCSVで準備
（今回ファイル名は **yodoyabashi.csv** に設定）

|発車時刻|列車種別|行先|備考|
|-------|------------------|------------------|------------------|
|05:04|普通|出町柳|３扉車|
|05:33|普通|三条|３扉車|
|...|...|...|...|


## コード例

① APIモードでアプリを新規作成（今回アプリの名前は、 **keihan_api** に設定）

```command:command
$ rails new keihan_api --api
```

② keihanディレクトリまで移動

```command:command
$ cd keihan_api
```

③ 時刻表データを格納するモデル（Timetabe）を実装

|カラム|データ型||
|-------|------------------|------------------|
|dept_time|String|発車時刻|
|train_type|String|列車種別|
|destination|String|行先|
|memo|String|備考|

```command:command
$ rails g model Timetable dept_time:String train_type:String destination:String memo:String
```

④ マイグレーションを実行

```command:command
$ rails db:migrate
```

⑤ 時刻表データ（yodoyabashi.csv）を、dbディレクトリに格納

⑤ db/seed.rbを編集

```ruby:db/seeds.rb
require 'csv'

CSV.foreach('db/yodoyabashi.csv') do |row|
    Timetable.create(:dept_time => row[0],:train_type => row[1],:destination => row[2],:memo => row[3])
end
```

⑥ マイグレーションを実行

```command:command
$ rails db:seed
```

## 実行結果

下記コマンドを入力後、http://localhost:3000/timetables にアクセス

```command:command
$ rails s
```

時刻表のデータがJSONで帰ってくることが確認できる。

![スクリーンショット 2017-10-04 1.59.59.png](https://qiita-image-store.s3.amazonaws.com/0/199441/2f60be67-7e3e-c1c3-9e8a-8c2164287d07.png)
