# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

project_id       = attribute('project_id')
name             = attribute('name')
region           = attribute('region')
credentials_path = attribute('credentials_path')
memory_size_gb   = attribute('memory_size_gb')

ENV['CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE'] = credentials_path

control 'redis-instance' do
  describe command("gcloud redis instances describe #{name} --project=#{project_id} --region=#{region} --format=json") do
    its('exit_status') { should eq 0 }
    its('stderr') { should eq '' }

		let(:metadata) do
  	  if subject.exit_status == 0
  	    JSON.parse(subject.stdout, symbolize_names: true)
  	  else
  	    {}
  	  end
  	end

		it { expect(metadata).to include(memorySizeGb: memory_size_gb.to_i) }

  end
end
