# create_table "requirements", force: :cascade do |t|
#   t.string "company_name"
#   t.string "email"
#   t.string "project_name"
#   t.string "project_details"
#   t.string "budget"
#   t.string "username"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "state", default: "Waiting"
# end

FactoryBot.define do
  factory :project do
    name { "MyString" }
    budget { "MyBoolean" }
    state { "MyString" }
    email { "MyString" }
    company_name { "MyString" }
    user_name { "MyString" }
    project_details { "MyString" }
    project_name { "MyString" }

  end
end
