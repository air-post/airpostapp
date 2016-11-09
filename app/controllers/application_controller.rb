class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def parse_json_object(title, value, flags = nil,
                        invalid_message: nil, missing_message: nil,
                        max_str_length: nil, too_long_message: nil)
    case
    when value.is_a?(Hash)
      return value
    when value.blank?
      if (flags & REQUIRED == REQUIRED)
        raise required_error(title, missing_message||"missing")
      end
      return
    when value.is_a?(String)
      if (max_str_length && value.length > max_str_length)
        raise InvalidParameter.new(title, too_long_message||"too long")
      end
      begin
        v = JSON.parse(value)
      rescue TypeError, JSON::ParserError
        raise InvalidParameter.new(title, invalid_message||"invalid JSON")
      end
      unless v.is_a?(Hash)
        raise InvalidParameter.new(title, invalid_message||"not a JSON object")
      end
      return v
    else
      raise InvalidParameter.new(title, invalid_message||"not an object")
    end
  end

end
