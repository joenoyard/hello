class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true
      t.references :credential, index: true
      t.string :user_agent_string
      t.string :access_token
      t.datetime :expires_at,      default:  DateTime.new(2000, 1,1)
      t.datetime :sudo_expires_at, default:  DateTime.new(2000, 1,1)

      t.timestamps
      t.index :access_token
    end
  end
end
