# create_table "mods", force: :cascade do |t|
#   t.string "name"
#   t.string "code"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
FactoryBot.define do
  factory :mods do
    name { "MyString" }
    code { "MyString" }
    datetime { "MyBoolean" }
  end
end
