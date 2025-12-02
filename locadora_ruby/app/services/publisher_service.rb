class PublisherService
    def initialize(publisher)
        @publisher = publisher
    end

    def create
        publisher =  Publisher.new(@publisher)
        if publisher.save
            return { success: true, publisher: publisher }
        else
            return { success: false, errors: publisher.errors.full_messages }
        end
    end
end