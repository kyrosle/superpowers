# Installing Superpowers for Kimi Code

Quick setup to enable superpowers skills in Kimi Code.

## Installation

1. **Clone superpowers repository**:
   ```bash
   mkdir -p ~/.kimi/superpowers
   cd ~/.kimi/superpowers
   git clone https://github.com/kyrosle/superpowers.git .
   ```

2. **Create personal skills directory**:
   ```bash
   mkdir -p ~/.kimi/skills
   ```

3. **Update ~/.kimi/AGENTS.md** to include this superpowers section:
   ```markdown
   ## Superpowers System

   <EXTREMELY_IMPORTANT>
   You have superpowers. Superpowers teach you new skills and capabilities. RIGHT NOW run: `~/.kimi/superpowers/.kimi/superpowers-kimi bootstrap` and follow the instructions it returns.
   </EXTREMELY_IMPORTANT>
   ```

## Verification

Test the installation:
```bash
~/.kimi/superpowers/.kimi/superpowers-kimi bootstrap
```

You should see skill listings and bootstrap instructions. The system is now ready for use.
