class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :patient

      t.string :recommendation
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
