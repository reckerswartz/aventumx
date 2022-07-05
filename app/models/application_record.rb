# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  ##############################################################################
  ### Includes and Extensions ##################################################
  include Discard::Model

  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Callbacks ################################################################

  ##############################################################################
  ### Associations #############################################################

  ##############################################################################
  ### Validations ##############################################################

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################

  ##############################################################################
  ### Class Methods ############################################################
  primary_abstract_class

  ##############################################################################
  ### Instance Methods #########################################################
  def random_bg_cover
    image_path_prefix = 'app/assets/images/'
    image_files = Dir.glob("#{image_path_prefix}cool-backgrounds/*")
    image_path_prefix + image_files.sample.split(image_path_prefix)[1]
  end

  def find_unique_username(username)
    taken_usernames =
      self.class
          .with_discarded
          .where('username LIKE ?', "#{username}%")
          .pluck(:username)

    # return username if it's free
    unless taken_usernames.include?(username) ||
           is_reserved_word?(username)
      return username
    end

    # find a unique username
    count = 1
    loop do
      # Generate the username using the original name and the random cool prefix
      new_username = "#{first_name}_#{Haikunator.haikunate(0).downcase.tr('-', '_')}".parameterize.underscore
      # If the username is not taken, return it
      unless taken_usernames.include?(new_username) ||
             is_reserved_word?(username)
        Rails.logger.info { "new_username: #{new_username}" }
        return new_username
      end

      count += 1
      ## break if we've checked 100 times, to avoid infinite loop
      break if count > 100 # arbitrary number
    end
  end

  def is_reserved_word?(word)
    ActionController::Base.instance_methods.include?(word) ||
      ActiveRecord::Base.instance_methods.include?(word) ||
      friendly_id_config.reserved_words.include?(word)
  end

  #########

  # protected

  #########

  #######

  # private

  #######
end
