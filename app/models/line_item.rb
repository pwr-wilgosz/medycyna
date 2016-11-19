class LineItem < ApplicationRecord
  belongs_to :receipt, inverse_of: :line_items
end

