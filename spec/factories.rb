FactoryGirl.define do

  factory :article do
    category

    factory :articles_with_edits do
      transient do
        edits_count 5
      end

      after(:create) do |article, evaluator|
        create_list(:edit, evaluator.edit_count, article: article)
      end
    end
  end

  factory :edit do
    article
    author
    approver
    title "Arrays"
    content "Arrays are awesome"
  end

  factory :category do
    name "Ruby"

    factory :categories_with_articles do
      transient do
        articles_count 5
      end

      after(:create) do |category, evaluator|
        create_list(:article, evaluator.article_count, category: category)
      end
    end
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user, aliases: [:approver, :author] do
    username    "john"
    email

    factory :users_with_edits do
      transient do
        edits_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:edit, evaluator.edit_count, user: user)
      end
    end
  end

end