require "rails_helper"

RSpec.describe QuestionManager::HottestLister do
  context '.execute' do
    let(:params) { Hash.new }
    let(:instance) { described_class.new(period, params) }
    let(:result) { instance.execute }

    context 'period equal 1 week' do
      let(:period) { 1.week }
      let(:question) { create(:question) }
      let(:question2) { create(:question) }
      let!(:question_access) { create(:question_access, question: question, times_accessed: 2) }
      let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1) }

      it { expect(result.first.question_id).to eq(question.id)}
      it { expect(result.second.question_id).to eq(question2.id)}
    end

    context 'period equal 1 month' do
      let(:period) { 1.month }
      let(:question) { create(:question) }
      let!(:question_access) { create(:question_access, question: question, times_accessed: 2, 
        date: DateTime.now - 3.week) }
      let(:question2) { create(:question) }
      let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1, 
        date: DateTime.now - 3.week) }

      it { expect(result.first.question_id).to eq(question.id)}
      it { expect(result.second.question_id).to eq(question2.id)}
    end

    context 'period equal 1 year' do
      let(:period) { 1.year }
      let(:question) { create(:question) }
      let!(:question_access) { create(:question_access, question: question, times_accessed: 2, 
        date: DateTime.now - 11.month) }
      let(:question2) { create(:question) }
      let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1, 
        date: DateTime.now - 11.month) }

      it { expect(result.first.question_id).to eq(question.id)}
      it { expect(result.second.question_id).to eq(question2.id)}
    end
  end
end