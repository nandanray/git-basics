# 🧬 Git Workshop Guide for Bioinformatics
## Mastering Version Control for Scientific Computing

## Table of Contents
- [Workshop Overview](#-workshop-overview)
- [Pre-Workshop Setup](#-pre-workshop-setup)
- [Session 1: Git Theory](#-session-1-git-theory-1-hour)
- [Session 2: Hands-on Practice](#-session-2-hands-on-practice-1-hour)
- [Bonus: Git Tips & Tricks](#-bonus-git-tips--tricks)
- [Bonus Challenges & Projects](#-bonus-challenges--projects)
- [Resources & Wrap-up](#-workshop-wrap-up)
- [Creating a Git Repository and Pushing to GitHub](#-creating-a-git-repository-and-pushing-to-github)

## 🎯 Workshop Overview
**Duration**: 2 hours (1 hour theory + 1 hour hands-on)  
**Target Audience**: Bioinformatics practitioners and researchers  
**Prerequisites**: Basic command line knowledge  
**Workshop Style**: Interactive, hands-on, with real-world scenarios

## 🚀 Pre-Workshop Setup
### Instructor Checklist
- [ ] Git installation (version ≥ 2.30.0)
- [ ] Sample bioinformatics repository
- [ ] Presentation environment ready
- [ ] Backup plans for common issues
- [ ] Fun examples prepared!

### 🔧 Participant Requirements
```bash
# Check if Git is installed
git --version

# If not installed:
# Windows: Download from git-scm.com
# Mac: 
brew install git
# Linux:
sudo apt-get install git
```

## 🎓 Session 1: Git Theory (1 Hour)

### 🌟 Introduction (10 minutes)
"Imagine you're running a complex genomic analysis, and your pipeline suddenly stops working. Wouldn't it be great to have a time machine for your code? That's exactly what Git is!"

#### Why Git in Bioinformatics?
- 🧪 Experiment tracking
- 📊 Multiple analysis versions
- 👥 Team collaboration
- 🔄 Pipeline reproducibility

### 🎮 Interactive Demonstrations (20 minutes)

#### The Git Time Machine
```bash
# Create a genomics project
mkdir genome_analysis
cd genome_analysis
git init

# Create analysis files
echo "#!/bin/bash\nfastqc *.fastq" > qc_script.sh
git add qc_script.sh
git commit -m "Add QC script"

# Make changes
echo "multiqc ." >> qc_script.sh
git diff  # Show changes dramatically!
```

#### 🎭 Role-Playing Scenario
Split participants into pairs:
- Researcher A: Makes pipeline changes
- Researcher B: Reviews and merges changes

### 🌳 Branching (20 minutes)
"Branches are like parallel universes - perfect for testing new analysis methods!"

```bash
# Create a branch for testing a new aligner
git checkout -b feature/new-aligner

# Make changes
echo "bwa mem ref.fa reads.fq > aln.sam" > align.sh
git add align.sh
git commit -m "Try BWA-MEM aligner"

# Compare with original branch
git checkout main
git diff feature/new-aligner
```

## 🎪 Session 2: Hands-on Practice (1 Hour)

### 🎯 Exercise 1: Time Travel (15 minutes)
```bash
# Create analysis versions
echo "v1 analysis" > analysis.py
git add analysis.py
git commit -m "First version"

echo "v2 analysis" > analysis.py
git add analysis.py
git commit -m "Second version"

# Time travel challenge
git checkout HEAD~1  # Go back in time!
```

### 🎲 Exercise 2: Merge Conflicts Battle (15 minutes)
Create intentional conflicts and solve them:

```bash
# Create conflict scenario
git checkout -b team-member-1
echo "def analyze():\n    print('Team 1 analysis')" > analyze.py
git commit -am "Team 1 changes"

git checkout -b team-member-2 main
echo "def analyze():\n    print('Team 2 analysis')" > analyze.py
git commit -am "Team 2 changes"

# Merge and resolve!
git checkout main
git merge team-member-1
git merge team-member-2  # CONFLICT! 
```

### 🎨 Exercise 3: Git Art (15 minutes)
Create an ASCII art commit history:

```bash
# Create branches to form a pattern
git checkout -b feature-1
git checkout -b feature-2
git checkout -b feature-3
git merge feature-1
```

### 🎭 Exercise 4: Real-world Simulation (15 minutes)
Simulate a real bioinformatics workflow:

```bash
# Create pipeline structure
mkdir -p {data,scripts,results}
touch data/samples.txt scripts/pipeline.sh results/.gitkeep

# Track changes
git add .
git commit -m "Setup analysis structure"

# Simulate pipeline evolution
echo "#!/bin/bash\nfastqc data/*.fastq" > scripts/pipeline.sh
git commit -am "Add FastQC step"

echo "multiqc ." >> scripts/pipeline.sh
git commit -am "Add MultiQC report generation"
```

## 🎁 Bonus: Git Tips & Tricks

### 🔥 Power User Commands
```bash
# 1. Super Log
git log --graph --oneline --all --decorate

# 2. Find which commit broke your code
git bisect start
git bisect bad  # Current version is broken
git bisect good <commit-hash>  # Last known good version

# 3. Stash unfinished changes
git stash save "Work in progress on feature X"
git stash pop  # Restore later

# 4. Undo last commit but keep changes
git reset --soft HEAD~1

# 5. See who changed what
git blame pipeline.sh

# 6. Create aliases for common commands
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch

# 7. Clean up local branches
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d

# 8. Search commit history
git log --grep="bug fix"

# 9. Interactive rebase to clean history
git rebase -i HEAD~5

# 10. Save credentials
git config --global credential.helper cache
```

### 🎩 Advanced Git Magic

#### 1. Custom Git Hooks
```bash
# Create pre-commit hook to run tests
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh
python -m pytest tests/
EOF
chmod +x .git/hooks/pre-commit
```

#### 2. Git Reflog - Your Safety Net
```bash
# View reference log
git reflog

# Recover deleted branch
git checkout -b recovered-branch HEAD@{2}
```

#### 3. Partial Commits
```bash
# Stage parts of files
git add -p

# Commit parts of files
git commit -p
```

### 🎮 Fun Git Aliases
```bash
# Add these to your .gitconfig
[alias]
    # Show a pretty log graph
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

    # Undo last commit
    undo = reset HEAD~1 --mixed

    # List all branches with details
    branches = branch -av

    # See recent branches
    recent = for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"
```

### 🎯 Pro Tips for Bioinformatics Projects

1. **Structure Your Repository**
```
project/
├── data/
│   ├── raw/
│   └── processed/
├── scripts/
│   ├── preprocessing/
│   └── analysis/
├── results/
│   ├── figures/
│   └── tables/
├── docs/
└── README.md
```

2. **Manage Large Files**
```bash
# Use Git LFS for large genomic data
git lfs install
git lfs track "*.bam"
git lfs track "*.fastq.gz"
```

3. **Document Everything**
```bash
# Create comprehensive commit messages
git commit -m "Add variant calling pipeline

- Implemented GATK4 HaplotypeCaller
- Added filtering for Q>30
- Includes documentation for parameters
- Tested on chr21 data"
```

## 🎯 Bonus Challenges & Projects

### 🎮 Challenge 1: The Pipeline Evolution
Create a Git repository that shows the evolution of a bioinformatics pipeline:

```bash
# Initialize your challenge repo
git init pipeline-evolution
cd pipeline-evolution

# Create basic structure
mkdir -p {scripts,config,docs}
touch scripts/pipeline.sh config/params.yml docs/README.md

# Commit initial structure
git add .
git commit -m "Initial pipeline setup"
```

**Task Requirements:**
1. Create at least 3 feature branches:
   - `feature/fastq-qc`
   - `feature/alignment`
   - `feature/variant-calling`
2. Each branch should include:
   - Pipeline script updates
   - Configuration changes
   - Documentation updates
3. Create meaningful commit messages
4. Generate conflicts and resolve them
5. Create a visual commit graph

Share your repository with a link to: https://github.com/nandanray

### 🧬 Challenge 2: The Genomics Git Game
Create a repository that demonstrates different DNA sequence analysis approaches:

```bash
# Create the game repository
git init dna-analysis-game
cd dna-analysis-game

# Setup initial sequence
echo "ATGCGATCGTAGCTAGC" > sequence.fasta
git add sequence.fasta
git commit -m "Initial sequence"
```

**Task Requirements:**
1. Create branches for different analysis methods:
   - `analysis/blast`
   - `analysis/hmmer`
   - `analysis/custom-align`
2. Each branch should contain:
   - Analysis scripts
   - Result visualizations
   - Performance comparisons
3. Use Git tags to mark versions
4. Create a detailed README explaining your approach

Share your creative solutions with: https://github.com/nandanray

### 🔬 Challenge 3: Collaborative Pipeline Builder
Build a modular bioinformatics pipeline where each module is developed in its own branch:

```bash
# Initialize the project
git init modular-pipeline
cd modular-pipeline

# Create basic structure
mkdir -p {modules,tests,docs}
touch modules/core.sh tests/test_core.sh docs/architecture.md
```

**Task Requirements:**
1. Develop these modules in separate branches:
   - `module/input-validation`
   - `module/quality-control`
   - `module/alignment`
   - `module/variant-calling`
   - `module/report-generation`
2. Each module should have:
   - Main script
   - Test suite
   - Configuration file
   - Documentation
3. Use Git submodules for external dependencies
4. Implement pre-commit hooks for testing
5. Create an integration branch showing how all modules work together

Share your modular approach with: https://github.com/nandanray

### 🎨 Challenge 4: Git Artist
Create a repository with a commit history that creates an ASCII art pattern when viewed with `git log --graph`:

```bash
# Start the art project
git init git-art
cd git-art

# Create initial commit
touch canvas.txt
git add canvas.txt
git commit -m "Canvas ready"
```

**Task Requirements:**
1. Create a pattern using branches and merges
2. Each commit should add one element to the ASCII art
3. Final result should create a meaningful pattern
4. Bonus: Make the pattern bioinformatics-themed (e.g., DNA helix)

Share your artistic creation with: https://github.com/nandanray

### 🚀 Challenge 5: Time Travel Pipeline
Create a repository demonstrating different versions of the same pipeline evolving over time:

```bash
# Initialize time travel project
git init pipeline-time-machine
cd pipeline-time-machine

# Setup initial version
mkdir -p v1
touch v1/basic-pipeline.sh
```

**Task Requirements:**
1. Create 5 different versions of the pipeline:
   - v1: Basic FastQ processing
   - v2: Added alignment
   - v3: Added variant calling
   - v4: Added quality reports
   - v5: Added cloud integration
2. Use tags for versions
3. Include benchmarks for each version
4. Create a comparison document
5. Use Git notes to add additional information to commits

Share your time machine with: https://github.com/nandanray

### 📤 How to Share Your Challenges

1. Push your repository to GitHub:
```bash
# Add your remote
git remote add origin https://github.com/YOUR-USERNAME/REPOSITORY-NAME.git
git branch -M main
git push -u origin main

# Push all branches and tags
git push --all origin
git push --tags origin
```

2. Open a pull request or issue on nandanray's repositories to share your work.
3. Tag @nandanray in your repository's README.

### 🏆 Bonus Points For:
- Creative branch naming
- Comprehensive documentation
- Interesting commit messages
- Clear progression of changes
- Novel approaches to bioinformatics problems
- Clean and organized repository structure
- Usage of advanced Git features
- Integration of CI/CD pipelines

## 📤 Creating a Git Repository and Pushing to GitHub

### Step-by-Step Procedure

1. **Create a new directory for your project:**
    ```bash
    mkdir my-new-repo
    cd my-new-repo
    ```

2. **Initialize a new Git repository:**
    ```bash
    git init
    ```

3. **Create a new file and add some content:**
    ```bash
    echo "# My New Repository" > README.md
    ```

4. **Add the file to the staging area:**
    ```bash
    git add README.md
    ```

5. **Commit the file to the repository:**
    ```bash
    git commit -m "Initial commit"
    ```

6. **Create a new repository on GitHub:**
    - Go to https://github.com and log in.
    - Click the "+" icon in the top right corner and select "New repository".
    - Name your repository (e.g., `my-new-repo`) and click "Create repository".

7. **Add the GitHub repository as a remote:**
    ```bash
    git remote add origin https://github.com/YOUR-USERNAME/my-new-repo.git
    ```

8. **Push the local repository to GitHub:**
    ```bash
    git branch -M main
    git push -u origin main
    ```

### Summary of Commands
```bash
mkdir my-new-repo
cd my-new-repo
git init
echo "# My New Repository" > README.md
git add README.md
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR-USERNAME/my-new-repo.git
git branch -M main
git push -u origin main
```

## 🎉 Workshop Wrap-up

### 🎯 Key Takeaways
1. Git is your time machine
2. Branches are your parallel universes
3. Commits are your snapshots
4. Collaboration is key

### 📚 Resources
- 🔗 Interactive Git: https://learngitbranching.js.org/
- 📘 Git Book: https://git-scm.com/book/en/v2
- 🎮 Git Game: https://github.com/git-game/git-game

---
*Created with ❤️ for Bioinformatics by Nandan Ray*  
*Last Updated: February 6, 2025*
