# example of controller level controller security policy

class ContentSecurityPolicyController < ApplicationController
  content_security_policy do |policy|
    policy.script_src :self, :https, "https://example.com"
  end
end
