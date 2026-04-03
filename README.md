# OMZ Custom Setup Backup

This folder contains a backup of your Oh My Zsh custom configuration and helper scripts to quickly recreate your Python and R environments on a new machine.

## Contents

- `aliases.zsh`, `git.zsh`, `completion_config.zsh`, etc.
- `plugins/` and `themes/` (including `zsh-autosuggestions` and `powerlevel10k`)
- `qmk_firmware/`
- `zap_history.zsh`
- `.gitignore` (to keep sensitive files like `Cercle.zsh` out of git)
- `python_common_env.py` – defines your common Python environment using `uv`
- `R_common_packages.R` – defines your common R packages using `renv`

You can define your environment variables either directly in your main `~/.zshrc` or in a separate `~/.oh-my-zsh/custom/env_variable.zsh` file that you source from `.zshrc`.

## 1. Restore Zsh custom files

After installing Oh My Zsh on a new machine, restore your custom files:

```bash
mkdir -p ~/.oh-my-zsh/custom
cp -R ~/Documents/omz-custom-setup/* ~/.oh-my-zsh/custom/
```

This gives you your aliases, plugins, themes, and the helper scripts:

- `~/.oh-my-zsh/custom/python_common_env.py`
- `~/.oh-my-zsh/custom/R_common_packages.R`

## 2. Python: set up common environment with uv

### 2.1 Install uv (once per machine)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then restart your terminal (or open a new one) so `uv` is on your `PATH`.

### 2.2 Create the common Python environment

```bash
cd ~/.oh-my-zsh/custom
uv sync --script python_common_env.py
```

This installs your commonly used Python libraries (e.g. `numpy`, `pandas`, `matplotlib`, `requests`, `ipython`, `jupyterlab`) into a `uv`-managed environment.

### 2.3 Test the environment

```bash
uv run python_common_env.py
```

You should see a message indicating the common Python environment is ready.

### 2.4 Use the environment in VS Code

1. Open VS Code.
2. Open a project folder where you want to work.
3. Use the Command Palette → **Python: Select Interpreter**.
4. Choose the interpreter corresponding to the `uv` environment created for `python_common_env.py`.

## 3. R: set up common packages with renv

You typically do this **per project**, so each R project has its own isolated library.

### 3.1 Create and initialize your first renv project

In the terminal:

```bash
mkdir -p ~/Projects/my-first-renv-project
cd ~/Projects/my-first-renv-project
```

In R or RStudio, with the working directory set to that folder:

```r
install.packages("renv")   # only needed once on a fresh system
renv::init()
```

### 3.2 Install your common packages and snapshot

Still in R or RStudio:

```r
source("~/.oh-my-zsh/custom/R_common_packages.R")
```

This script:

- Ensures `renv` is installed.
- Installs your common packages (e.g. `tidyverse`, `data.table`, `readr`, `ggplot2`, `devtools`) into the project.
- Runs `renv::snapshot()` to record exact package versions in the project.

### 3.3 Reuse for future R projects

For each new R project:

```r
renv::init()
source("~/.oh-my-zsh/custom/R_common_packages.R")
```

This gives the project the same base set of R packages, managed by `renv`.

## 4. Minimal first-day checklist on a new machine

1. Restore Zsh custom files:

   ```bash
   mkdir -p ~/.oh-my-zsh/custom
   cp -R ~/Documents/omz-custom-setup/* ~/.oh-my-zsh/custom/
   ```

2. Install `uv` and set up Python:

   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   exec zsh        # or open a new terminal
   cd ~/.oh-my-zsh/custom
   uv sync --script python_common_env.py
   uv run python_common_env.py
   ```

3. In R or RStudio, for your first project:

   ```r
   install.packages("renv")
   renv::init()
   source("~/.oh-my-zsh/custom/R_common_packages.R")
   ```

After this, Python and R should have your usual tools ready, and future R projects can be bootstrapped with the same `source("~/.oh-my-zsh/custom/R_common_packages.R")` call.

