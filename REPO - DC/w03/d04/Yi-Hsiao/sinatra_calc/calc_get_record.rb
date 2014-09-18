# get the nth calculation performed
# notifies the user, if that record doesn't exist yet
get "/calculator/:nth_record" do |nth_record|
  @records = Calculation.where(id: nth_record).pluck
  slim :records
end
