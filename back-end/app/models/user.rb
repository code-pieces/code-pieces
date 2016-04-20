class User < ActiveRecord::Base
  has_many :social_accounts
  has_many :snippets, foreign_key: :created_by

  has_secure_password


  # def self.from_omniauth(auth)
  #   SocialAccount.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |social_account|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end

  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end

  # callback handler for login with facebook
  # 1. user is existed with a linked facebook account
  # 2. user is existed but not facebook account
  # 3. user is not existed, return nil
  def self.from_omniauth(auth)
    # Check out the Auth Hash function at https://github.com/mkdynamic/omniauth-facebook#auth-hash
    # and figure out how to get email for this user.
    # Note that Facebook sometimes does not return email,
    # in that case you can use facebook-id@facebook.com as a workaround
    # binding.pry
    # find users by uid

    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    account = SocialAccount.find_by_uid(auth[:uid])

    if account.nil?
      # do not have facebook acccount
      # check if user is existed by email
      existed_user = User.find_by_email(email)

      # existed_user && existed_user.accounts.create(uid: auth[:uid], provider: auth[:provider]).user
      if existed_user.nil?
        # cannot find old email. Your account is not existed
        # create new user & account
        existed_user = User.create(name: auth[:info][:name], email: email,
          password: "123")
      end

      existed_user.social_accounts.create(uid: auth[:uid], provider: auth[:provider])
      existed_user
    else
      # facebook account is existed
      account.user
    end

    # user = account && (account.user || )
    # user = where(email: email).first_or_initialize
    # user.accounts.build(uid: auth[:uid], provider: auth[:provider])
    # #
    # # Set other properties on user here.
    # # You may want to call user.save! to figure out why user can't save
    # #
    # # Finally, return user
    # user.save && user
  end
end
