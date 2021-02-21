class Article < ApplicationRecord
end

# == Schema Information
#
# Table name: articles
#
#  id                     :bigint           not null, primary key
#  url                    :string(255)      not null
#  title                  :string(255)      not null
#  description            :string(255)
#  translated_title       :string(255)
#  translated_description :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
