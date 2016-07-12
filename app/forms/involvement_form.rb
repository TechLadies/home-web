class InvolvementForm < BaseForm

  attr_reader :case_file
  attr_accessor :involvable, :involvement

  def initialize(case_file, params={})
    @case_file = case_file
    self.involvement = @case_file.involvements.build
    involvable_type = params.dig(:involvement_attributes, :involvable_type)
    self.involvable = involvable_type.safe_constantize.new if involvable_type
    super(params)
  end

  def save
    if valid?
      case_file.transaction do
         unless involvement.involvable_id
          involvement.involvable = involvable
          involvable.save!
        end
        involvement.save!
      end
    end
    errors.empty?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message)
    errors.empty?
  end

  def attributes=(params)
  end

  def involvement_attributes=(params)
    involvement.attributes = params
  end

  def involvable_attributes=(params)
    involvable.attributes = params
  end

end
