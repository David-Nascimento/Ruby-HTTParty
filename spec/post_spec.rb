

describe "POST - Create User" do
    context "New User" do
        let(:result) { ApiUser.save(build(:user).to_hash) }
        it { expect(result.response.code).to eql "200" }
    end

    context "when duplicate email" do
        let(:result) { ApiUser.save(build(:registered_user).to_hash) }
        it { expect(result.response.code).to eql "409" }
        it { expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
    end

    context "When wrong email" do
        let(:result) { ApiUser.save(build(:user_wrong_email).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
    end

    context "when Not Empty email" do
        let(:result) { ApiUser.save(build(:empty_email).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
    end

    context "when Not Emptyd full name" do
        let(:result) { ApiUser.save(build(:empty_full_name).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
    end

    context "when Not Empty password" do
        let(:result) { ApiUser.save(build(:empty_password).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
    end

    context "when full_name not null" do
        let(:result) { ApiUser.save(build(:full_name_notNull).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Users.full_name cannot be null" }
    end

    context "when password not null" do
        let(:result) { ApiUser.save(build(:password_notNull).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Users.password cannot be null" }
    end

    context "when email not null" do
        let(:result) { ApiUser.save(build(:email_notNull).to_hash) }
        it { expect(result.response.code).to eql "412" }
        it { expect(result.parsed_response["msg"]).to eql "Users.email cannot be null" }
    end
end
