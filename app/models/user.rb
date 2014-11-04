class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_many :tweets
  has_secure_password
  validates :password, length: { minimum: 6 }

  def set_image(file)
  	# fileがnilかどうかをしらべるための関数
  	if !file.nil?
  		# ファイル名
  		file_name = file.original_filename
  		# 画像をアップロード
    	File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
    	# データベースにファイル名を保存するため
    	self.image = file_name
  	end
  end

end
