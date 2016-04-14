module Models
  class NotFoundError < StandardError; end

  class User
    attr_accessor :id, :name
    cattr_accessor :objects

    @@objects = []

    def initialize(id:, name:)
      @id = id
      @name = name
      @@objects << self
      self
    end

    def self.all
      objects
    end

    def self.find(id)
      obj = all.select { |o| o.id == id }.first
      raise NotFoundError, "object with id: #{id} is'n found" unless obj
      obj
    end

    def self.create(opts = {})
      new(opts)
    end

    def update(opts = {})
      self.name = opts[:name]
      self
    end

    def destroy
      self.class.all.delete_if { |o| o.id == id }
      self
    end
  end
end
