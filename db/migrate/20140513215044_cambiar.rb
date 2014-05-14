class Cambiar < ActiveRecord::Migration
    def change
    rename_column :users, :ci, :state
    end
end
