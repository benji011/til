---
title: "You can make GitHub Copilot obey coding & formatting conventions using a markdown file"
date: 2025-07-25T00:00:00Z
tags: [github, copilot, ai, productivity]
---

Instead of repeatedly correcting GitHub Copilot's suggestions, you can create a markdown file with your project's coding conventions and drag it into Copilot's context window to guide its behavior.

**How it works:**

Create a markdown file (e.g., `.github/copilot-instructions.md`) with your project guidelines:

```markdown
# Coding Conventions

- Focus on readability, not excessive performance optimization
- This project uses `uv`, not `poetry`
- Use single quotes for strings
- Prefer explicit type hints
- Write descriptive variable names

# Meta instruction
If I clarify something that could have been added here, suggest the change.
```

Then drag this file into GitHub Copilot's Agent mode context window.

**What to include:**

- **Project-specific tools**: "This project uses Playwright, not Selenium"
- **Style preferences**: "Use functional components, not class components"
- **Architecture patterns**: "Follow repository pattern for data access"
- **Naming conventions**: "Use snake_case for functions, PascalCase for classes"
- **Meta instructions**: Ask Copilot to suggest improvements to the instructions

**Why this works:**

Copilot can now reference your conventions when generating code, significantly reducing:
- Code that ignores existing patterns
- Using the wrong libraries or tools
- Style inconsistencies requiring manual cleanup
- Misunderstanding of project architecture

**The feedback loop:**

Including "if I clarify something that could have been added here, suggest the change" creates a self-improving system where Copilot helps refine its own instructions based on your corrections.

[Original source](https://www.linkedin.com/posts/ryanvarley_i-used-github-copilot-agent-mode-while-coding-activity-7351573955138187266-nl5r/)
