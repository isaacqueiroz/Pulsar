class AddItensToDetails < ActiveRecord::Migration
  def change
    add_column :details, :tipo, :integer, :default => 0
    add_column :details, :cronico, :boolean, :default => true
  end
end
