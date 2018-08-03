RSpec::Matchers.define :have_value do |value|
  match { |node| node.value == value }

  failure_message do |actual|
    "Expected the field '#{actual[:name]}' to have value '#{value}', but it was '#{actual[:value]}' instead"
  end

  failure_message_when_negated do |actual|
    "Expected the field '#{actual[:name]}' not to have value '#{value}', but it did"
  end
end
