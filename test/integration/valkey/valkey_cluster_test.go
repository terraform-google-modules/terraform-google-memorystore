// Copyright 2022 Google LLC
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

package valkey_cluster

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestValkeyCluster(t *testing.T) {
	rc := tft.NewTFBlueprintTest(t)

	rc.DefineVerify(func(assert *assert.Assertions) {
		projectId := rc.GetTFSetupStringOutput("project_id")
		clusterRegion := rc.GetStringOutput("cluster_region")
		clusterId := rc.GetStringOutput("cluster_id")
		clusterName := rc.GetStringOutput("cluster_name")
		shardCount := rc.GetStringOutput("shard_count")
		transitEncryptionMode := rc.GetStringOutput("transit_encryption_mode")
		replicaCount := rc.GetStringOutput("replica_count")
		authorizationMode := rc.GetStringOutput("authorization_mode")
		nodeType := rc.GetStringOutput("node_type")

		op := gcloud.Runf(t, "beta memorystore instances describe %s --project %s --location %s", clusterName, projectId, clusterRegion)
		assert.Equal(op.Get("name").String(), clusterId, "mismatched clusterName")
		assert.Equal(op.Get("shardCount").String(), shardCount, "mismatched shardCount")
		assert.Equal(op.Get("transitEncryptionMode").String(), transitEncryptionMode, "mismatched transitEncryptionMode")
		assert.Equal(op.Get("replicaCount").String(), replicaCount, "mismatched replicaCount")
		assert.Equal(op.Get("authorizationMode").String(), authorizationMode, "mismatched authorizationMode")
		assert.Equal(op.Get("engineVersion").String(), "VALKEY_8_0", "mismatched engineVersion")
		assert.Equal(op.Get("nodeType").String(), nodeType, "mismatched nodeType")
		assert.Equal(op.Get("engineConfigs.maxmemory-policy").String(), "volatile-ttl", "mismatched valkeyConfigs.maxmemory-policy")
	})

	rc.Test()
}
