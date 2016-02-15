class CreateMemocities < ActiveRecord::Migration
  def change
    create_table :memocities do |t|
      t.string :phoneNumberMemo
      t.text :contentMemo
      t.datetime :activationDateMemo

      t.timestamps null: false
    end
  end
end
