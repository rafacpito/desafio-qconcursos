require "rails_helper"

RSpec.describe QuestionsController, type: :controller do
  let!(:question) { create(:question, daily_access: 10) }
  let!(:question2) { create(:question, daily_access: 9) }
  let(:result) { JSON.parse(response.body) }

  before { get :hottest }

  it { expect(result.keys).to eq(['questions', 'meta']) }

  context 'questions' do
    let(:result) { super()['questions'] }

    it{ expect(result.count).to eq(2) }
    it{ expect(result.first['id']).to eq(question.id) }
    it{ expect(result.second['id']).to eq(question2.id) }
  end
end