# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

require 'faker'
require 'factory_bot'
include FactoryBot::Syntax::Methods

module AppSeeds
  class FakerChatRooms
    class << self
      def seed
        # chat_room_attrs = []
        # 5.times do
        #   chat_room_attrs << attributes_for(:chat_room)
        # end
        # 5.times do
        #   chat_room_attrs << attributes_for(:direct_chat_room)
        # end
        # 5.times do
        #   chat_room_attrs << attributes_for(:group_chat_room)
        # end
        # 5.times do
        #   chat_room_attrs << attributes_for(:private_chat_room)
        # end
      end
    end
  end
end
