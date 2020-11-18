class Admin::StrategiesController < Flip::StrategiesController
  before_action :assert_authenticated_as_admin
end