#
# Copyright 2011 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module Backstage
  module TorqueBoxManaged
    def name
      return mbean.name if mbean.respond_to?( :name )
      $1 if full_name =~ /name=(.*)$/
    end

    def app_name
      $1.gsub('.trq', '') if full_name =~ /app=(.*?)(,|$)/
    end

    def app
      App.find( "torquebox.apps:app=#{app_name}.trq" )
    end
    
    def status
      mbean.status.downcase.capitalize
    end
  end
end
