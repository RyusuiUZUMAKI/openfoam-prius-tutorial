#!/bin/bash

echo "Cleaning case..."

# 時間ステップ削除(0は残す)
rm -rf [1-9]* 0.[0-9]*

# 並列計算結果削除
rm -rf processor*

# ポスト処理削除
rm -rf postProcessing

# ParaViewファイル削除
rm -f *.foam

echo "Cleaned."