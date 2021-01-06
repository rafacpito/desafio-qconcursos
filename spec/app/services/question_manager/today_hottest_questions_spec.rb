require "rails_helper"

RSpec.describe QuestionManager::TodayHottestQuestions do
  context '.execute' do
    let(:params) { Hash.new }
    let(:instance) { described_class.new(params) }
    let!(:question) { create(:question, daily_access: 10) }
    let!(:question2) { create(:question, daily_access: 9) }
    let(:result) { instance.execute }

    it { expect(result.first.id).to eq(question.id) }
    it { expect(result.second.id).to eq(question2.id) }
  end
end