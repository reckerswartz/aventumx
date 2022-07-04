# frozen_string_literal: true

# == Route Map
#
#                                     Prefix Verb   URI Pattern                                                                                       Controller#Action
#                            channel_members GET    /channel_members(.:format)                                                                        channel_members#index
#                                            POST   /channel_members(.:format)                                                                        channel_members#create
#                         new_channel_member GET    /channel_members/new(.:format)                                                                    channel_members#new
#                        edit_channel_member GET    /channel_members/:id/edit(.:format)                                                               channel_members#edit
#                             channel_member GET    /channel_members/:id(.:format)                                                                    channel_members#show
#                                            PATCH  /channel_members/:id(.:format)                                                                    channel_members#update
#                                            PUT    /channel_members/:id(.:format)                                                                    channel_members#update
#                                            DELETE /channel_members/:id(.:format)                                                                    channel_members#destroy
#                              chat_channels GET    /chat_channels(.:format)                                                                          chat_channels#index
#                                            POST   /chat_channels(.:format)                                                                          chat_channels#create
#                           new_chat_channel GET    /chat_channels/new(.:format)                                                                      chat_channels#new
#                          edit_chat_channel GET    /chat_channels/:id/edit(.:format)                                                                 chat_channels#edit
#                               chat_channel GET    /chat_channels/:id(.:format)                                                                      chat_channels#show
#                                            PATCH  /chat_channels/:id(.:format)                                                                      chat_channels#update
#                                            PUT    /chat_channels/:id(.:format)                                                                      chat_channels#update
#                                            DELETE /chat_channels/:id(.:format)                                                                      chat_channels#destroy
#                                attachments GET    /attachments(.:format)                                                                            attachments#index
#                                            POST   /attachments(.:format)                                                                            attachments#create
#                             new_attachment GET    /attachments/new(.:format)                                                                        attachments#new
#                            edit_attachment GET    /attachments/:id/edit(.:format)                                                                   attachments#edit
#                                 attachment GET    /attachments/:id(.:format)                                                                        attachments#show
#                                            PATCH  /attachments/:id(.:format)                                                                        attachments#update
#                                            PUT    /attachments/:id(.:format)                                                                        attachments#update
#                                            DELETE /attachments/:id(.:format)                                                                        attachments#destroy
#                                   messages GET    /messages(.:format)                                                                               messages#index
#                                            POST   /messages(.:format)                                                                               messages#create
#                                new_message GET    /messages/new(.:format)                                                                           messages#new
#                               edit_message GET    /messages/:id/edit(.:format)                                                                      messages#edit
#                                    message GET    /messages/:id(.:format)                                                                           messages#show
#                                            PATCH  /messages/:id(.:format)                                                                           messages#update
#                                            PUT    /messages/:id(.:format)                                                                           messages#update
#                                            DELETE /messages/:id(.:format)                                                                           messages#destroy
#                           account_settings GET    /account_settings(.:format)                                                                       account_settings#index
#                                            POST   /account_settings(.:format)                                                                       account_settings#create
#                        new_account_setting GET    /account_settings/new(.:format)                                                                   account_settings#new
#                       edit_account_setting GET    /account_settings/:id/edit(.:format)                                                              account_settings#edit
#                            account_setting GET    /account_settings/:id(.:format)                                                                   account_settings#show
#                                            PATCH  /account_settings/:id(.:format)                                                                   account_settings#update
#                                            PUT    /account_settings/:id(.:format)                                                                   account_settings#update
#                                            DELETE /account_settings/:id(.:format)                                                                   account_settings#destroy
#                                   profiles GET    /profiles(.:format)                                                                               profiles#index
#                                            POST   /profiles(.:format)                                                                               profiles#create
#                                new_profile GET    /profiles/new(.:format)                                                                           profiles#new
#                               edit_profile GET    /profiles/:id/edit(.:format)                                                                      profiles#edit
#                                    profile GET    /profiles/:id(.:format)                                                                           profiles#show
#                                            PATCH  /profiles/:id(.:format)                                                                           profiles#update
#                                            PUT    /profiles/:id(.:format)                                                                           profiles#update
#                                            DELETE /profiles/:id(.:format)                                                                           profiles#destroy
#                            social_accounts GET    /social_accounts(.:format)                                                                        social_accounts#index
#                                            POST   /social_accounts(.:format)                                                                        social_accounts#create
#                         new_social_account GET    /social_accounts/new(.:format)                                                                    social_accounts#new
#                        edit_social_account GET    /social_accounts/:id/edit(.:format)                                                               social_accounts#edit
#                             social_account GET    /social_accounts/:id(.:format)                                                                    social_accounts#show
#                                            PATCH  /social_accounts/:id(.:format)                                                                    social_accounts#update
#                                            PUT    /social_accounts/:id(.:format)                                                                    social_accounts#update
#                                            DELETE /social_accounts/:id(.:format)                                                                    social_accounts#destroy
#                           new_user_session GET    /login(.:format)                                                                                  users/sessions#new
#                               user_session POST   /login(.:format)                                                                                  users/sessions#create
#                       destroy_user_session DELETE /logout(.:format)                                                                                 users/sessions#destroy
#                          new_user_password GET    /secret/new(.:format)                                                                             users/passwords#new
#                         edit_user_password GET    /secret/edit(.:format)                                                                            users/passwords#edit
#                              user_password PATCH  /secret(.:format)                                                                                 users/passwords#update
#                                            PUT    /secret(.:format)                                                                                 users/passwords#update
#                                            POST   /secret(.:format)                                                                                 users/passwords#create
#                      new_user_confirmation GET    /verification/new(.:format)                                                                       users/confirmations#new
#                          user_confirmation GET    /verification(.:format)                                                                           users/confirmations#show
#                                            POST   /verification(.:format)                                                                           users/confirmations#create
#                            new_user_unlock GET    /unblock/new(.:format)                                                                            users/unlocks#new
#                                user_unlock GET    /unblock(.:format)                                                                                users/unlocks#show
#                                            POST   /unblock(.:format)                                                                                users/unlocks#create
#                      user_password_expired GET    /password_expired(.:format)                                                                       devise/password_expired#show
#                                            PATCH  /password_expired(.:format)                                                                       devise/password_expired#update
#                                            PUT    /password_expired(.:format)                                                                       devise/password_expired#update
# resend_code_user_two_factor_authentication GET    /two_factor_authentication/resend_code(.:format)                                                  devise/two_factor_authentication#resend_code
#             user_two_factor_authentication GET    /two_factor_authentication(.:format)                                                              devise/two_factor_authentication#show
#                                            PATCH  /two_factor_authentication(.:format)                                                              devise/two_factor_authentication#update
#                                            PUT    /two_factor_authentication(.:format)                                                              devise/two_factor_authentication#update
#                                     states GET    /states(.:format)                                                                                 addresses#states
#                         authenticated_root GET    /                                                                                                 users/dashboard#index
#                                       root GET    /                                                                                                 dashboard#index
#           turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#           turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#          turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#              rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#                 rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#              rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#        rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#              rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#               rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#             rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                            POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#          new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#         edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#              rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                            PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                            PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                            DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
#   new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#      rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#      rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#   rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                         rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                   rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                            GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                  rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#            rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                            GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                         rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                  update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                       rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :channel_members
  resources :chat_channels
  resources :attachments
  resources :messages
  resources :account_settings
  resources :profiles
  resources :social_accounts
  resources :case_studies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               unlock: 'unblock'
             },
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions',
               confirmations: 'users/confirmations',
               passwords: 'users/passwords',
               unlocks: 'users/unlocks'
             }

  get 'states', to: 'addresses#states'

  # Define logined user root path
  authenticated :user do
    root 'users/dashboard#index', as: :authenticated_root
  end
  # Defines the root path route ("/")
  root to: 'dashboard#index'

  # Route for Action Cable
  # The route that action cable uses by default is ‘/cable’ endpoint.
  # We will not need to explicitly specify our route to utilize our websocket connection.
  # If you would like to explicitly define the action cable route:
  # mount ActionCable.server => '/cable'
end
