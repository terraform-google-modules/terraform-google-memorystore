package redis

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestRedis(t *testing.T) {
	bpt := tft.NewTFBlueprintTest(t)

	bpt.DefineVerify(func(assert *assert.Assertions) {
		bpt.DefaultVerify(assert)

		projectId := bpt.GetStringOutput("project_id")

		op := gcloud.Runf(t, "redis instances describe test-redis --project=%s --region=us-east1", projectId)
		assert.True(op.Get("authEnabled").Bool())
		assert.Contains(op.Get("memorySizeGb").String(), "1")
		assert.Contains(op.Get("transitEncryptionMode").String(), "SERVER_AUTHENTICATION")
	})

	bpt.Test()
}
