FactoryBot.define do
  factory :articlesection do
    article_topic {"AI"}
    article_content {"Artificial Intelligence"}
    likes_count {0}
  end

  factory :categorysection do
    category {"Sample"}
  end

end
