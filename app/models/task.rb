class Task < ApplicationRecord
  belongs_to :user

  enum status: [:waiting_for_start, :started, :in_progress, :waiting, :closed, :finished, :canceled]
end
