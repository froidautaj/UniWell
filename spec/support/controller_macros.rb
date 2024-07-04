module ControllerMacros
  def login_user(role: 'superadmin')
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, role: role) # Using factory bot as an example
    end
  end
end
