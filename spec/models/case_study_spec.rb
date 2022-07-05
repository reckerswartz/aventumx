# == Schema Information
#
# Table name: case_studies
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  uuid_secure  :uuid             not null
#  uuid_token   :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_case_studies_on_discarded_at  (discarded_at)
#  index_case_studies_on_uuid_secure   (uuid_secure) UNIQUE
#  index_case_studies_on_uuid_token    (uuid_token) UNIQUE
#
require 'rails_helper'

RSpec.describe CaseStudy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
