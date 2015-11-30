json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :name, :phone, :email, :message
  json.url enquiry_url(enquiry, format: :json)
end
