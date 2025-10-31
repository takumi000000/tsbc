require "json"
require "yaml"

class Answer < ApplicationRecord
  belongs_to :subject, foreign_key: :department, primary_key: :c_code, optional: true

  EVALUATION_SENTINEL = "School Check".freeze

  def content_items
    return @content_items if defined?(@content_items)

    value = read_attribute(:content)
    return @content_items = value if value.is_a?(Array)
    return @content_items = [] if value.blank?

    parsed = JSON.parse(value)
    @content_items = Array.wrap(parsed)
  rescue JSON::ParserError
    begin
      parsed_yaml = YAML.safe_load(value, permitted_classes: [], aliases: false)
      @content_items = Array.wrap(parsed_yaml)
    rescue Psych::SyntaxError
      @content_items = Array.wrap(value)
    end
  end

  def evaluation_response?
    items = content_items
    items.first.present? && items.first != EVALUATION_SENTINEL && items.size >= 3
  end

  def teacher_name
    evaluation_response? ? content_items.first : nil
  end

  def evaluation_scores
    return [] unless evaluation_response?

    content_items[1...-2] || []
  end

  def good_points
    evaluation_response? ? content_items[-2] : nil
  end

  def improvement_points
    evaluation_response? ? content_items[-1] : nil
  end
end
