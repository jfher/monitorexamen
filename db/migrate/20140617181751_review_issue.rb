class ReviewIssue < ActiveRecord::Migration
  def change
  	add_reference :reviews, :issue, index: true
  end
end
