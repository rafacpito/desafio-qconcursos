module QuestionManager
  class HottestLister
    attr_accessor :period, :page

    def execute
      question_accesses = QuestionAccess.where(date: (DateTime.now - period)..DateTime.now).group(:question_id).select('question_id, SUM(times_accessed) as total_times_accessed')
        .order('total_times_accessed desc').page(page ? page.to_i : 1)
      raise ActiveRecord::RecordNotFound if question_accesses.blank?
      question_accesses
    end

    private

    def initialize(period, params)
      @period = period
      @page = params[:page]
    end
  end
end