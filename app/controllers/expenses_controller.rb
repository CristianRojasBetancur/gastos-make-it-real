class ExpensesController < ApplicationController
  def index
    p params[:concept]
    p params[:category_id]
    if params[:concept].nil? || params[:category_id].nil?
      @expenses = Expense.order("date DESC")
    else
      @expenses = Expense.where("concept LIKE ? AND category_id LIKE ?",
      "%#{params[:concept]}%",
      "%#{params[:category_id]}%"
      ).order("date DESC")
    end
  end
end

# Book.where("title LIKE ?", params[:title] + "%")
