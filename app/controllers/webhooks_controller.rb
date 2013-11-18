class EventsController < ApplicationController  
      protect_from_forgery :except => [ :stripe_events ]  
      def stripe_events  
        # params['type'] will give u type of stripe event  
      end  
end  	