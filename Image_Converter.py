from PIL import Image
import pillow_heif
import os
import glob
import shutil

# HEIC対応の初期化
pillow_heif.register_heif_opener()

# 各ディレクトリ設定
input_dir = './PUT_IMAGE_HERE'
output_dir = './dataset/images'
predict_dir = './Predict'
os.makedirs(output_dir, exist_ok=True)
os.makedirs(predict_dir, exist_ok=True)

# 対象とする拡張子
valid_exts = ['.HEIC', '.heic', '.jpg', '.jpeg', '.png']

# 対象画像を取得（拡張子ごとに）
image_paths = []
for ext in valid_exts:
    image_paths.extend(glob.glob(os.path.join(input_dir, f'*{ext}')))
image_paths = sorted(image_paths)  # 並び順を安定化

converted_paths = []

# すべての画像をJPEGに変換して保存
for img_path in image_paths:
    basename = os.path.splitext(os.path.basename(img_path))[0]
    output_path = os.path.join(output_dir, basename + '.jpg')

    try:
        with Image.open(img_path) as img:
            rgb_img = img.convert('RGB')
            rgb_img.save(output_path, 'JPEG')
            converted_paths.append(output_path)
    except Exception as e:
        print(f"画像変換に失敗しました: {img_path}\n理由: {e}")

print(f"{len(converted_paths)}枚の画像をJPEGとして保存しました。")

# 最初の5枚をPredictフォルダにコピー
for jpg_path in converted_paths[:5]:
    shutil.copy(jpg_path, os.path.join(predict_dir, os.path.basename(jpg_path)))

print("最初の5枚をPredictフォルダにコピーしました。")
