class QuestionsController < ApplicationController
  def hottest
    hottest_lister = QuestionManager::TodayHottestQuestions.new(params).execute
    render json: hottest_lister, meta: pagination_meta(hottest_lister), each_serializer: QuestionSerializer
  end

  def hottest_in_period
    hottest_lister = QuestionManager::HottestLister.new(define_period, params).execute
    render json: hottest_lister, meta: pagination_meta(hottest_lister), each_serializer: QuestionAccessSerializer
  end

  private

  def define_period
    case params[:period]
    when 'week'
      return 1.week
    when 'month'
      return 1.month
    else
      return 1.year
    end
  end
end
