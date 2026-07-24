# Rails Upgrade Skill

A skill for Claude Code and OpenCode that analyzes Rails applications and provides comprehensive upgrade assessments.

## What It Does

When invoked in a Rails project, this skill:

1. Verifies you're in a Rails application
2. Detects your current Rails version
3. Fetches the latest Rails release from GitHub
4. Classifies the upgrade type (patch/minor/major)
5. Retrieves the official Rails upgrade guide
6. Fetches configuration diffs from railsdiff.org
7. Generates a comprehensive upgrade summary with complexity rating

## Prerequisites

- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated

## Installation

### Claude Code

1. Create the skills directory if it doesn't exist:
   ```bash
   mkdir -p ~/.claude/skills
   ```

2. Clone or copy this skill to the skills directory:
   ```bash
   git clone https://github.com/robzolkos/skill-rails-upgrade.git ~/.claude/skills/rails-upgrade
   ```

   Or copy manually:
   ```bash
   cp -r /path/to/skill-rails-upgrade ~/.claude/skills/rails-upgrade
   ```

3. Restart Claude Code to load the skill.

### OpenCode

1. Create the skill directory if it doesn't exist:
   ```bash
   mkdir -p ~/.config/opencode/skill
   ```

2. Clone or copy this skill to the skill directory:
   ```bash
   git clone https://github.com/robzolkos/skill-rails-upgrade.git ~/.config/opencode/skill/rails-upgrade
   ```

   Or copy manually:
   ```bash
   cp -r /path/to/skill-rails-upgrade ~/.config/opencode/skill/rails-upgrade
   ```

3. Restart OpenCode to load the skill.

## Usage

Navigate to a Rails project directory and invoke the skill:

```
/rails-upgrade
```

The skill will analyze your Rails application and provide:

- **Version Information**: Current vs latest Rails version
- **Upgrade Complexity Assessment**: Small/Medium/Large rating based on multiple factors
- **Key Changes**: Configuration updates, deprecations, breaking changes
- **Recommended Steps**: Step-by-step upgrade process
- **Resources**: Links to official guides and diffs

## Example Output

```
### Version Information
- Current version: 7.1.3
- Latest version: 8.0.1
- Upgrade type: Major

### Upgrade Complexity Assessment: Large

| Factor | Rating |
|--------|--------|
| Version jump | Major version |
| Breaking changes | Many, significant |
| Config changes | Extensive |

### Key Changes to Address
1. New default framework defaults
2. Updated Active Record encryption
3. Kamal deployment changes
...
```

## License

MIT
