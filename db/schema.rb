ActiveRecord::Schema.define(version: 2021_06_11_102029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer "user_id"
    t.string "topic"
    t.string "content"
    t.integer "likes_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commentsections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.string "commment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likesections", force: :cascade do |t|
    t.integer "article_id"
    t.string "users_liked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "userdetails", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
