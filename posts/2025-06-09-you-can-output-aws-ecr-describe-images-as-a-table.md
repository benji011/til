---
title: "You can output `aws ecr describe-images` as a table"
date: 2025-06-09T00:00:00Z
tags: [aws, ecr, cli]
---

Instead of parsing JSON output from AWS ECR commands, you can format the results as a readable table using the `--output table` flag.

**Default JSON output:**

```bash
aws ecr describe-images --repository-name my-repo --region us-east-1
# Returns verbose JSON
```

**Table output:**

```bash
aws ecr describe-images \
  --repository-name my-repo \
  --region us-east-1 \
  --query 'sort_by(imageDetails,&imagePushedAt)[-1]' \
  --output table
```

**What you get:**

Instead of JSON blobs, you'll see a cleanly formatted table with:
- Column headers
- Aligned values
- Much better readability
- Easy scanning of image details

**Other useful --output options:**

- `table` - Human-readable table format
- `text` - Tab-delimited text
- `json` - Default JSON format (verbose)
- `yaml` - YAML format

**Combining with --query:**

The `--query` parameter lets you filter and sort results using JMESPath:

```bash
# Get the most recently pushed image
--query 'sort_by(imageDetails,&imagePushedAt)[-1]'

# Get only specific fields
--query 'imageDetails[*].[imageTags[0],imagePushedAt]'
```

This makes it much easier to quickly check image details, tags, and push dates without writing JSON parsing scripts.

[Original source](https://dev.to/benji011/til-you-can-output-aws-ecr-describe-images-as-a-table-3f4g)
