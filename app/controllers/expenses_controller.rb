class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    p params[:concept]
    p params[:category_id]
    if params[:concept].nil? || params[:category_id].nil?
      @expenses = Expense.where(user_id: current_user.id).order("date DESC")
    else
      @expenses = Expense.where(user_id: current_user.id).where("concept LIKE ? AND category_id LIKE ?",
      "%#{params[:concept]}%",
      "%#{params[:category_id]}%"
      ).order("date DESC")
    end
  end
end

# Book.where("title LIKE ?", params[:title] + "%")
