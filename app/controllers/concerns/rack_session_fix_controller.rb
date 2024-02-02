# This module is implemented as a workaround for the `ActionDispatch::Request::Session::DisabledSessionError`
# encountered in Rails API-only applications using Devise. Since these applications don't use sessions,
# Devise's attempt to access or manipulate the session can lead to errors. By introducing a fake session object
# (`FakeRackSession`), we can bypass these session checks, allowing Devise to function without enabling actual
# session management. This ensures compatibility with the stateless nature of API-only apps.

module RackSessionFixController
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env["rack.session"] ||= FakeRackSession.new
    end
  end
end
