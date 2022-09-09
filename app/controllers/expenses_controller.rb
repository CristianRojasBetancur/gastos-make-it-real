class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = Expense.where(user_id: current_user.id).order("date DESC")
    unless params[:concept].nil? || params[:category_id].nil?
      @expenses = Expense.where("user_id = ? AND concept LIKE ? AND category_id LIKE ?",
      current_user.id,
      "%#{params[:concept]}%",
      "%#{params[:category_id]}%"
      ).order("date DESC")
    end
  end
end
