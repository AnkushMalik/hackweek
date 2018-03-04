class AddProjhitsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :projhits, :integer, default: 0
  end
end
