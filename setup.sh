#!/bin/bash

echo "=========================================================="
echo "         仮想環境　rinkoucnn-env　を作成中　                  "
echo "=========================================================="
echo ""
conda env create -f environment.yaml
echo ""
source ~/anaconda3/etc/profile.d/conda.sh


echo "=========================================================="
echo "                仮想環境の作成が完了しました！                 "
echo "=========================================================="
echo ""
echo ""


echo ""
echo "　　　Jupyterで仮想環境が使えるようカーネル登録中...　　　　　　"
python -m ipykernel install --user --name=rinkoucnn-env --display-name "Python (rinkoucnn-env)"


echo ""
echo "                YOLOのリポジトリをクローン中...               "
git clone https://github.com/ultralytics/ultralytics.git
echo ""

echo ""
echo "セットアップ完了！この仮想環境では以下のことができます！"
echo "    - labelImg でラベリング（GUI）"
echo "    - YOLO を使った学習・推論"

echo ""



echo "=========================================================="
echo "まずは以下のコマンドを打ってください！　　　　　　　　　　　　"
echo "conda activate rinkoucnn-env"
echo "=========================================================="

echo ""
