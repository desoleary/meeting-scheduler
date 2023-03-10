module MeetingScheduler
  class Meeting
    MEETING_TYPES = %i[onsite offsite].freeze

    attr_reader :name, :duration, :type

    # @param [String] name meeting name
    # @param [BigDecimal] duration meeting duration in hours
    # @param [Symbol] type meeting type and  one of :onsite or :offsite
    def initialize(name, duration, type)
      type = type.to_sym if type.is_a?(String)

      raise ArgumentError, "name must be filled, given #{name}" if name.blank?

      if MEETING_TYPES.exclude?(type)
        raise ArgumentError, "type: must be one of #{MEETING_TYPES.inspect}, given #{type}"
      end

      unless Rordash::NumericUtil.numeric?(duration)
        raise ArgumentError, "duration: must be a number, given #{duration}"
      end

      @name = name
      @duration = duration
      @type = type
    end
  end
end
