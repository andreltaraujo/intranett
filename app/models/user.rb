class User < ApplicationRecord

  # Associations
  has_many :tasks

  # Enums
  enum role: [:collaborator, :manager]

  # Scopes
  scope :restricted_access, -> {where(collaborator: true)}
  scope :full_access, -> {where(manager: true)}

  # Permissions
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

  # Validations
  #validates :name, presence: true, length: {minimun: 3}, on: :update

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end