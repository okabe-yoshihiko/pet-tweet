class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [300, 300]

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file #=> ローカルストレージ
  end
  # storage :fog

  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先(S3で確認すると出てくる)
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end