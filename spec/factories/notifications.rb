FactoryGirl.define do
  factory :notification do
    recipient_id 1
actor_id 1
action "MyString"
notifiable_id 1
notifiable_type "MyString"
string "MyString"
read_at "2018-03-05 03:16:38"
  end

end
