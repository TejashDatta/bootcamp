class PersonCallbacks
  extend ActiveModel::Callbacks

  attr_accessor :created_at, :updated_at

  define_model_callbacks :save, only: %i[before after]
  
  before_save :record_timestamps

  def save
    run_callbacks :save do
      true
    end
  end

  private

  def record_timestamps
    current_time = Time.current
    self.created_at ||= current_time
    self.updated_at = current_time
  end
end
