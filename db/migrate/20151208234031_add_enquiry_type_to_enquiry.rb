class AddEnquiryTypeToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :enquiry_type, :string
  end
end
