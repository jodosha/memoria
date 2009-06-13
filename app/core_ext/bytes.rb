module Memoria
  module Bytes
    KILOBYTE = 1024
    MEGABYTE = KILOBYTE * 1024
    GIGABYTE = MEGABYTE * 1024
    TERABYTE = MEGABYTE * 1024

    def kilobyte
      self * KILOBYTE
    end

    def megabyte
      self * MEGABYTE
    end

    def gigabyte
      self * GIGABYTE
    end

    def terabyte
      self * TERABYTE
    end
  end
end