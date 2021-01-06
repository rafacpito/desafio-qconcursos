require "rails_helper"

RSpec.describe QuestionsController, type: :controller do
  let!(:question) { create(:question, daily_access: 10) }
  let!(:question2) { create(:question, daily_access: 9) }
  let!(:question_access) { create(:question_access, question: question, times_accessed: 2) }
  let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1) }
  let(:params) { { period: period } }
  let(:result) { JSON.parse(response.body) }

  before { get :hottest_in_period, params: params }

  context 'sending period as week' do
    let(:period) { 'week' }

    it { expect(result.keys).to eq(['question_accesses', 'meta']) }

    context 'question_accesses' do
      let(:result) { super()['question_accesses'] }

      it { expect(result.first.keys).to eq(['total_times_accessed', 'question']) }
      it { expect(result.size).to eq(2) }
      it { expect(result.first['question']['id']).to eq(question.id) }
      it { expect(result.second['question']['id']).to eq(question2.id) }    
    end
  end

  context 'sending period as month' do
    let!(:question_access) { create(:question_access, question: question, times_accessed: 2,
      date: DateTime.now - 3.week) }
    let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1,
      date: DateTime.now - 3.week) }

    let(:period) { 'month' }

    it { expect(result.keys).to eq(['question_accesses', 'meta']) }

    context 'question_accesses' do
      let(:result) { super()['question_accesses'] }

      it { expect(result.first.keys).to eq(['total_times_accessed', 'question']) }
      it { expect(result.size).to eq(2) }
      it { expect(result.first['question']['id']).to eq(question.id) }
      it { expect(result.second['question']['id']).to eq(question2.id) }    
    end
  end

  context 'sending period as year' do
    let!(:question_access) { create(:question_access, question: question, times_accessed: 2,
      date: DateTime.now - 11.month) }
    let!(:question_access2) { create(:question_access, question: question2, times_accessed: 1,
      date: DateTime.now - 11.month) }

    let(:period) { 'year' }

    it { expect(result.keys).to eq(['question_accesses', 'meta']) }

    context 'question_accesses' do
      let(:result) { super()['question_accesses'] }

      it { expect(result.first.keys).to eq(['total_times_accessed', 'question']) }
      it { expect(result.size).to eq(2) }
      it { expect(result.first['question']['id']).to eq(question.id) }
      it { expect(result.second['question']['id']).to eq(question2.id) }    
    end
  end
end