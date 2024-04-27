# frozen_string_literal: true

json.array! @content_groups, partial: 'content_groups/content_group', as: :content_group
