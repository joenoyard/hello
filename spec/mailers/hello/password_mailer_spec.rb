require "spec_helper"

module Hello
  describe PasswordMailer do
    # describe "sign_up" do
    #   let(:mail) { PasswordMailer.sign_up }

    #   it "renders the headers" do
    #     expect(mail.subject).to eq("Sign up")
    #     expect(mail.to).to eq(["to@example.org"])
    #     expect(mail.from).to eq(["from@example.com"])
    #   end

    #   it "renders the body" do
    #     expect(mail.body.encoded).to match("Hi")
    #   end
    # end
    # describe "confirmation" do
    #   let(:mail) { PasswordMailer.confirmation }

    #   it "renders the headers" do
    #     expect(mail.subject).to eq("Confirmation")
    #     expect(mail.to).to eq(["to@example.org"])
    #     expect(mail.from).to eq(["from@example.com"])
    #   end

    #   it "renders the body" do
    #     expect(mail.body.encoded).to match("Hi")
    #   end
    # end

    describe "forgot" do
      let(:credential) { create(:classic_credential) }
      let(:mail) { PasswordMailer.forgot(credential, "THE_URL") }

      it "renders the headers" do
        expect(mail.subject).to eq("Reset password instructions")
        expect(mail.to).to eq([credential.email])
        expect(mail.from).to eq(["hello@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hello #{credential.user.name},")
        expect(mail.body.encoded).to match(">THE_URL</a>")
      end
    end


  end
end
