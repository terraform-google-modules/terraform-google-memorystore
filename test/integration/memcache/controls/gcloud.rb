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
cpu_count        = attribute('cpu_count')
memory_size_mb   = attribute('memory_size_mb')

output_id        = attribute('output_id')
output_region    = attribute('output_region')

describe 'Outputs' do
  it 'should reflect inputted variables' do
    expect(output_region).to eq region
  end

  it 'should have a valid id' do
    expect(output_id).to end_with name
  end
end

control 'memcache-instance' do
  describe command("gcloud beta memcache instances describe #{name} --project=#{project_id} --region=#{region} --format=json") do
    its('exit_status') { should eq 0 }
    its('stderr') { should eq '' }

    let(:metadata) do
      if subject.exit_status == 0
        JSON.parse(subject.stdout)
      else
        {}
      end
    end

    it "nodeConfig.cpucount matches var.cpu_count" do
       expect(metadata['nodeConfig']['cpuCount']).to eq(cpu_count)
    end
    it "nodeConfig.memorySizeMb matches var.memory_size_mb" do
      expect(metadata['nodeConfig']['memorySizeMb']).to eq(memory_size_mb)
    end

  end
end
