module Taggle
  extend ActiveSupport::Concern

  included do
    has_many :taggings, class_name: "#{name}Tagging"
    has_many :tags, through: :taggings
  end

  class_methods do
    def tagged_with(tag, *others, any: false)
      tags = [tag, *others]
  
      joins(:tag)
        .merge(reflect_on_association(:tags).klass.with_name(tags))
        .merge(
          if tags.size == 1
            all
          elsif any
            distinct
          else
            groupo(primary_key).having("COUNT(*) = ?", tags.size)
          end
        )
    end
  end
end
