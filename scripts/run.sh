#!/bin/bash
set -e  # エラーで停止

echo "==== OpenFOAM case start ===="

# メッシュ生成
echo "[1/4] blockMesh"
blockMesh

echo "[2/4] snappyHexMesh"
snappyHexMesh -overwrite

# メッシュチェック
echo "[3/4] checkMesh"
checkMesh

# 計算実行
echo "[4/4] simpleFoam"
simpleFoam

echo "==== Finished ===="