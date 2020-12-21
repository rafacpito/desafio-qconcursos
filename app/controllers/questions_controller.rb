class QuestionsController < ApplicationController
  def hottest
    hottest_lister = QuestionManager::HottestLister.new(24.hours, params).execute
    render json: hottest_lister, meta: pagination_meta(hottest_lister), each_serializer: QuestionAccessSerializer
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
    when 'year'
      return 1.year
    else
      return 24.hours
    end
  end
end
