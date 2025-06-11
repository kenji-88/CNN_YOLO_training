@echo off
echo ==============================================
echo    仮想環境 rinkoucnn-env 作成中...
echo ==============================================
echo.

REM 仮想環境作成（environment.yaml を使う）
call conda env create -f environment.yaml

REM 仮想環境有効化（bat内では環境反映されない点に注意）
call conda activate rinkoucnn-env

REM Jupyter kernel 登録（jupyter, ipykernel が必要）
echo.
echo Jupyter kernel を登録中...
python -m ipykernel install --user --name=rinkoucnn-env --display-name "Python (rinkoucnn-env)"

REM YOLOのリポジトリをクローン（重複確認付き）
echo.
IF NOT EXIST ultralytics (
    echo YOLOリポジトリをクローン中...
    git clone https://github.com/ultralytics/ultralytics.git
) ELSE (
    echo YOLOリポジトリは既に存在します。スキップします。
)

echo.
echo ==============================================
echo セットアップ完了！
echo 次のコマンドを Anaconda Prompt で実行してください:
echo   conda activate rinkoucnn-env
echo ==============================================
pause
