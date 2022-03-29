package memcache

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestMemcache(t *testing.T) {
	bpt := tft.NewTFBlueprintTest(t)

	bpt.DefineVerify(func(assert *assert.Assertions) {
		bpt.DefaultVerify(assert)

		projectId := bpt.GetStringOutput("project_id")

		op := gcloud.Runf(t, "beta memcache instances describe example-memcache --project=%s --region=us-east1", projectId)
		assert.Contains(op.Get("nodeConfig.cpuCount").String(), "1")
		assert.Contains(op.Get("nodeConfig.memorySizeMb").String(), "1024")
	})

	bpt.Test()
}
