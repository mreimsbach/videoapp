require "rails_helper"

RSpec.describe SubscriptionMailer, type: :mailer do

    context "new_video" do
      before (:example) do
        @user = create(:user, channel: create(:channel_with_courses))
        @video = create(:video)
        @mail = SubscriptionMailer.new_video(@user, @user.channel, @video)
      end
      it 'renders the subject' do
        expect(@mail.subject).to eql("One of your subscribed channels has been updated")
      end

      it 'renders the receiver email' do
        expect(@mail.to).to eql([@user.email])
      end

      it 'renders the sender email' do
        expect(@mail.from).to eql(['sschmidt@avarteq.de'])
      end
    end
    context "new_course" do
      before (:example) do
        @user = create(:user, channel: create(:channel_with_courses))
        @video = create(:video)
        @mail = SubscriptionMailer.new_course(@user, @user.channel, @video)
      end
      it 'renders the subject' do
        expect(@mail.subject).to eql("One of your subscribed channels has been updated")
      end

      it 'renders the receiver email' do
        expect(@mail.to).to eql([@user.email])
      end

      it 'renders the sender email' do
        expect(@mail.from).to eql(['sschmidt@avarteq.de'])
      end
    end
end
