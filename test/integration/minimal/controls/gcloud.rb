# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

project_id       = attribute('project_id')
name             = attribute('name')
region           = attribute('region')
location_id      = attribute('location_id')
memory_size_gb   = attribute('memory_size_gb')

output_id                  = attribute('output_id')
output_region              = attribute('output_region')
output_host                = attribute('output_host')
output_current_location_id = attribute('output_current_location_id')

describe 'Outputs' do
  it 'should reflect inputted variables' do
    expect(output_region).to eq region
    expect(output_current_location_id).to eq location_id
  end

  it 'should have a valid host ip' do
    expect(output_host).to match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)
  end

  it 'should have a valid id' do
    expect(output_id).to end_with name
  end
end

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
