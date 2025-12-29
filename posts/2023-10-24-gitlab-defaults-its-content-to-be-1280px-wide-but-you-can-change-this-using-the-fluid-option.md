---
title: "GitLab defaults its content to be 1280px wide, but you can change this using the Fluid option"
date: 2023-10-24T00:00:00Z
tags: [gitlab]
---

By default, GitLab's page content is fixed at 1280 pixels wide, which can feel constraining on larger displays. You can switch to a fluid layout that stretches across your entire screen width.

**To change the layout:**

1. Select your avatar in the upper-right corner
2. Choose **Preferences**
3. Scroll to the **Behavior** section
4. Under **Layout width**, choose between:
   - **Fixed**: Maintains the default 1280px width
   - **Fluid**: Stretches content across the entire page width
5. Click **Save changes**

The fluid layout is particularly useful when:
- Reviewing diffs with long lines of code
- Viewing wide tables or CI pipeline graphs
- Working on ultra-wide monitors
- Reading documentation with code examples

This makes much better use of screen real estate on modern wide displays and reduces horizontal scrolling.

[Original source](https://docs.gitlab.com/ee/user/profile/preferences.html#layout-width)
