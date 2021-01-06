module QuestionManager
  class TodayHottestQuestions
    attr_accessor :page

    def execute
      Question.order(daily_access: :desc).page(page ? page.to_i : 1)
    end

    private

    def initialize(params)
      @page = params[:page]
    end
  end
end