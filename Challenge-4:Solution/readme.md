# Git Artist Challenge Solution: DNA Double Helix

This guide will help you create a DNA double helix pattern in your Git commit history using strategic branching and merging.

## Final Result Preview

When completed, your `git log --graph` will look something like this:

```
*   Merge branch 'helix-right'
|\  
| * Right strand base T
* | Left strand base A
|\|
| * Right strand base G
* | Left strand base C
|\|
| * Right strand base A
* | Left strand base T
|\|
| * Right strand base C
* | Left strand base G
|\|
| * Right strand base T
* | Left strand base A
|/
* Canvas ready
```

## Step-by-Step Instructions

### 1. Initialize the Repository

```bash
# Create and enter the repository
git init git-art
cd git-art

# Create initial commit
touch canvas.txt
git add canvas.txt
git commit -m "Canvas ready"
```

### 2. Create the DNA Strands

```bash
# Create the right helix strand branch
git branch helix-right

# Add first left base (A)
echo "A" >> canvas.txt
git add canvas.txt
git commit -m "Left strand base A"

# Switch to right branch and add complementary base (T)
git checkout helix-right
echo "T" >> canvas.txt
git add canvas.txt
git commit -m "Right strand base T"

# Switch back to main and merge
git checkout main
git merge --no-ff helix-right

# Continue pattern with C-G pair
echo "C" >> canvas.txt
git add canvas.txt
git commit -m "Left strand base C"

git checkout helix-right
echo "G" >> canvas.txt
git add canvas.txt
git commit -m "Right strand base G"

git checkout main
git merge --no-ff helix-right

# Add T-A pair
echo "T" >> canvas.txt
git add canvas.txt
git commit -m "Left strand base T"

git checkout helix-right
echo "A" >> canvas.txt
git add canvas.txt
git commit -m "Right strand base A"

git checkout main
git merge --no-ff helix-right

# Add G-C pair
echo "G" >> canvas.txt
git add canvas.txt
git commit -m "Left strand base G"

git checkout helix-right
echo "C" >> canvas.txt
git add canvas.txt
git commit -m "Right strand base C"

git checkout main
git merge --no-ff helix-right

# Final A-T pair
echo "A" >> canvas.txt
git add canvas.txt
git commit -m "Left strand base A"

git checkout helix-right
echo "T" >> canvas.txt
git add canvas.txt
git commit -m "Right strand base T"

git checkout main
git merge --no-ff helix-right
```

### 3. Viewing Your Creation

To see the DNA helix pattern in your Git history:

```bash
git log --graph --oneline
# For more detailed view:
git log --graph
```

## How It Works

1. We create two main elements:
   - Main branch: Represents the left strand of DNA
   - helix-right branch: Represents the right strand of DNA

2. The pattern is created by:
   - Alternating commits between branches
   - Using `--no-ff` (no fast-forward) merges to preserve the branch structure
   - Adding complementary DNA bases (A-T, C-G pairs)

3. Each commit adds one base to the canvas.txt file, building up the sequence

## Bonus Features

- The pattern represents actual DNA base pairing (A-T, C-G)
- The final canvas.txt file contains a valid DNA sequence
- The visual pattern mimics the twisting nature of the DNA double helix

## Tips for Modifications

- To make the helix longer: Repeat the pattern with more base pairs
- To make it more compact: Use `--oneline` when viewing
- To add colors: Use `git log --graph --oneline --decorate`

## Troubleshooting

If your pattern doesn't look right:
- Ensure you're using `--no-ff` for all merges
- Check that you're switching branches correctly
- Verify each commit is made on the correct branch

Remember to commit each change individually to maintain the pattern structure.  
