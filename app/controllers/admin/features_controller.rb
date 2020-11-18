class Admin::FeaturesController < Flip::FeaturesController
  before_action :assert_authenticated_as_admin
end