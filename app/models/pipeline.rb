# == Schema Information
#
# Table name: pipelines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  repo       :string
#  triggers   :string
#  domain     :string
#
class Pipeline < ApplicationRecord
    has_many :runs, dependent: :destroy, foreign_key: 'pipeline_id'
    
    validates :name, presence: true
    validates :repo, presence: true, format: { with: /git\@(.*).git/, message: "please enter a valid git repository" }
end
