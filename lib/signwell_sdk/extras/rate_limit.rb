# frozen_string_literal: true

module SignWell
  class Configuration
    def max_rate_limit_retries
      @max_rate_limit_retries || 2
    end

    def max_rate_limit_retries=(value)
      unless value.is_a?(Integer) && value.between?(0, 10)
        raise ArgumentError, 'Rate limit retries must be an integer between zero and ten.'
      end

      @max_rate_limit_retries = value
    end
  end
end
