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
