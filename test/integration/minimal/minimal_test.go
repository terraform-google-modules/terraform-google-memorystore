// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package minimal

import (
	"fmt"
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestMinimalModule(t *testing.T) {

	const name = "test-minimal"
	const region = "us-east1"
	const hostIpRegEx = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
	const memorySize int64 = 1

	memStoreT := tft.NewTFBlueprintTest(t)

	memStoreT.DefineVerify(func(assert *assert.Assertions) {
		memStoreT.DefaultVerify(assert)

		projectId := memStoreT.GetStringOutput("project_id")
		op := gcloud.Run(t, fmt.Sprintf("redis instances describe %s --project %s --region %s", name, projectId, region))

		assert.Contains(op.Get("locationId").String(), region, "Memomystore instance's GCE region is valid")
		assert.Regexp(hostIpRegEx, op.Get("host").String(), "Memomystore instance has a valid host IP")
		assert.Contains(op.Get("name").String(), name, "Memomystore instance has a valid id")
		assert.Equal(memorySize, op.Get("memorySizeGb").Int(), "Memorystore instance has been allocated 1 GB of memory")
	})
	memStoreT.Test()
}
