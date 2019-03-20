# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  include DeviseTokenAuth::Concerns::User

  has_many :reviews

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '500x500#'
  }

  validates_attachment_content_type :image, :content_type => [
    "image/jpg", "image/jpeg", "image/png", "image/gif"
  ]

  def updateWithImage(params)
    if params[:image]
      picture_params = params[:image]
      data = params[:image][:data]
      filename = params[:image][:filename]

      image_file = Paperclip.io_adapters.for(data)
      image_file.original_filename = filename
      self.image = image_file
    end

    params = params.except(*[:image])

    self.update(params)
    self.save!
  end

end
