class AddDetailsToExam < ActiveRecord::Migration
  def change
    add_column :exams, :dataexame, :date
    add_column :exams, :obs, :text
  end
end
