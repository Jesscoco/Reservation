class Material < ApplicationRecord
    belongs_to :salle, optional: true
end
