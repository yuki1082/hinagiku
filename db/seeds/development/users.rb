%w(alice bob carol).each_with_index do |name|
	user = User.new
	user.login_name = name
	user.display_name = name.capitalize
	user.password = "password"
	user.setting_password = true
	user.save!
	email = Email.new(address: user.login_name + "@example.com")
	user.emails << email
end 