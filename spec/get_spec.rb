describe "get" do
    context "when a registeres user" do
        let(:user) { build(:registered_user) }
        let(:token) { ApiUser.token(user.email, user.password) }
        let(:result) { ApiUser.find(token, user.id) }

        it {expect(result.response.code).to eql "200"}
    end
end 