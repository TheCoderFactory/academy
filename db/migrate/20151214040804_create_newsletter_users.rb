class CreateNewsletterUsers < ActiveRecord::Migration
  def change
    create_table :newsletter_users do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :email,              null: false

      t.timestamps                  null: false
    end
  end
end
