# OpenFOAM Prius CFD Tutorial

🚗 簡易プリウスモデルを用いたCFDチュートリアル

## 概要

本リポジトリでは、簡易プリウス形状を用いた外部流れ解析（OpenFOAM）を再現できます。

書籍「Windowsネイティブのための流体数値解析環境構築編」の応用に対応しています。

## 書籍
[Windows ネイティブのための流体数値解析-環境構築偏-】【電子版(PDF)】をBoothで購入](https://ryusuiuzumaki.booth.pm/items/8149598)

* 使用ソルバ：foamRun
* 解析対象：自動車周りの流れ
* 目的：流れ場と圧力場の可視化

本ケースは教育用に簡略化されています。

実務では乱流モデルや境界条件の検討が必要です。

---

## 完成イメージ

### 圧力の空間分布(圧力場)

![pressure](images/pressure.gif)

### Velocity field (flow field)

![velocity](images/Flowfield.gif)

---

## クイックスタート（まずはここ）

軽量版ケースで数分以内に実行できます。

※ ワンコマンドで実行できるよう scripts/run.sh を用意しています。

※ case_light は計算時間短縮のため、物理時間（End Time）を 0.1 秒に設定しています。

```bash
git clone https://github.com/RyusuiUZUMAKI/openfoam-prius-tutorial.git
cd openfoam-prius-tutorial
cd case_light

# 実行
../scripts/run.sh
```

---

### トラブルシュート

スクリプトが実行できない場合：

```bash
sed -i 's/\r$//' scripts/*.sh
chmod +x scripts/*.sh
```

---

## 必要環境

* OpenFOAM v11 以降
* OS: Ubuntu 24.04 / WSL2（Windows11推奨）

---

## バージョン情報

- OpenFOAM v11 で動作確認済み

---

## ディレクトリ構成

```
openfoam-prius-tutorial
├── case_light/   # 軽量版（初心者向け）
├── case_full/    # 高解像度版（書籍対応）
├── images/       # 結果画像
└── scripts/      # 実行補助
```

---

## 実行手順（詳細）

### 1. メッシュ生成

```bash
blockMesh
snappyHexMesh -overwrite
checkMesh
```

### 2. 計算実行

```bash
foamRun
```

### 3. スクリプト

これらのスクリプトにより、コマンド入力を最小限にして解析を実行できます。

scripts/ に実行補助用スクリプトを用意しています。

- `../scripts/run.sh`  
  → メッシュ生成から計算実行までを一括で実行します

- `../scripts/paraFoam.sh`  
  → ParaView を起動します

- `../scripts/clean.sh`  
  → 初期条件 (0/) を残し、それ以外の計算結果を削除し計算実行前の状態に戻します。

---

## クイックチェック

計算が成功すると、以下のような流れ場が得られます。
（images/Flowfield.gif を参照）

---

## 計算時間の目安

| ケース     | 物理時間（End Time） | 計算時間 | スペック例 |
|------------|----------------------|----------|------------|
| case_light | 0.1 s（短縮版）      | 約15分   | Intel i7-11700K / 32GB RAM |
| case_full  | 10 s（実用レベル）   | 約25時間 | Intel i7-11700K / 32GB RAM |

---

## よくあるエラー

### snappyHexMesh が落ちる

* 原因：メモリ不足
* 対策：

  * refinement レベルを下げる

---

### foamRun が発散する

* 原因：メッシュ品質 or 境界条件
* 対策：

  * `checkMesh` を実行
  * 初期条件を見直す

---

## 書籍との対応

| 書籍章 | 内容     |
| --- | ------ |
| 第8章 | メッシュ生成,計算設定,結果解析   |

---

## ライセンス

MIT License

---

## 補足

本リポジトリには計算結果データは含まれていません。

再現性を重視し、ユーザー自身で計算を実行する構成としています。

本計算結果は教材用であり、現実との一致を保証するものではありません。

GitHubは更新する場合があります。

⭐ If this repository helped you, please consider giving it a star!