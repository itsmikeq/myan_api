class CustomRoute < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_many :route_keys, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :owner
  validates_presence_of :version
  validates_presence_of :data
  validates_numericality_of :version
  validates_uniqueness_of :name, scope: [:owner]

  # TODO: Refactor to a service
  before_create :validate_json
  before_update :validate_json
  after_create :do_keys
  before_update :do_keys

  def json
    Oj.load data
  end

  def self.recent_routes(count)
    order(created_at:
              :desc).limit(count).select("id","key")
  end

  private

  def do_keys
    if RouteKey.where(key: json.map(&:keys).flatten).any?
      RouteKey.where(key: json.map(&:keys).flatten).each do |key|
        # This is an AR record
        key.update(key: json.first.keys.first) # There is only one
      end
    else
      route_keys.create(key: json.first.keys.first)
    end
  end

  def validate_json
    json
    true
  rescue
    self.errors.add(:json_validation, "Unable to parse JSON")
    false
  end

end
