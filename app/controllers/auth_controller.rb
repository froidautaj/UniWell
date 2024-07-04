# frozen_string_literal: true

class AuthController < ApplicationController # :nodoc:
  before_action :authenticate_user!
end
