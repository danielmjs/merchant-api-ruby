module TophatterMerchant
  class BaseException < StandardError; end
  class BadContentTypeException < BaseException; end
  class UnauthorizedException < BaseException; end
  class BadRequestException < BaseException; end
  class NotFoundException < BaseException; end
  class ServerErrorException < BaseException; end
end
