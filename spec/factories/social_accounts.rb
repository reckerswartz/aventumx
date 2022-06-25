# frozen_string_literal: true

FactoryBot.define do
  factory :social_account do
    github_account { nil }
    linkedin_account { nil }
    google_account { nil }
    fcabook_account { nil }
  end
end
