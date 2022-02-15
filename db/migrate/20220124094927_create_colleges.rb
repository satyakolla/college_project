class CreateColleges < ActiveRecord::Migration[6.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :area
      t.bigint :code

      t.timestamps
    end
  end
end
