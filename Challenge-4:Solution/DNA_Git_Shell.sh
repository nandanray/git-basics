#!/bin/bash
# create-detailed-dna-helix.sh
# Creates an extremely detailed DNA double helix pattern in Git history

# Exit on any error
set -e

# Remove existing directory if it exists
rm -rf detailed-dna-art

# Create and initialize the repository
echo "Creating Enhanced DNA Helix Git Art..."
mkdir detailed-dna-art
cd detailed-dna-art
git init

# Determine the default branch name
DEFAULT_BRANCH=$(git symbolic-ref --short HEAD || echo "main")
echo "Using default branch: $DEFAULT_BRANCH"

# Create initial scaffold with detailed DNA introduction
cat > dna_intro.txt << EOL
DNA (Deoxyribonucleic Acid) - Molecular Structure Analysis
========================================================

Basic Information:
- Molecule Type: Double-stranded polynucleotide
- Structure Type: Right-handed double helix
- Discovery: Watson and Crick (1953)
- Genomic Role: Genetic information storage

Physical Properties:
- Diameter: 2.0 nm (20 Å)
- Nucleotide Spacing: 0.34 nm
- Mass per Nucleotide Pair: 650 daltons
- Density: 1.7 g/cm³
- Base Pair Rise: 3.4 Å
EOL

git add dna_intro.txt
git commit -m "Initial DNA molecular properties"

# Create the right backbone branch
git branch backbone-right

# Enhanced function to create a detailed nucleotide
create_detailed_nucleotide() {
    local number=$1
    local base=$2
    local formula=$3
    local strand=$4
    local base_properties=$5
    local filename="${strand}_${number}.txt"
    
    cat > "$filename" << EOL
${strand} Strand - Nucleotide ${number}:

1. Phosphate Group (PO4³⁻):
   - Chemical Formula: O=P(O⁻)-O-
   - Bond Angles: 120°
   - P-O Bond Length: 1.54 Å
   - Charge: Negative
   - Role: Forms phosphodiester bonds

2. Deoxyribose Sugar (C5H10O4):
   - Configuration: β-D-2-deoxyribose
   - Ring Structure: Five-membered furanose
   - C-O Bond Length: 1.43 Å
   - Pucker: C3'-endo (B-form)
   - Key Atoms: C1' to C5'

3. Nucleobase: ${base}
   - Formula: ${formula}
   ${base_properties}

4. Backbone Properties:
   - Glycosidic Bond (N-C1'): 1.47 Å
   - Sugar-Phosphate Bond: 1.60 Å
   - Torsion Angles:
     α: O3'-P-O5'-C5'
     β: P-O5'-C5'-C4'
     γ: O5'-C5'-C4'-C3'
     δ: C5'-C4'-C3'-O3'
     ε: C4'-C3'-O3'-P
     ζ: C3'-O3'-P-O5'
EOL
    
    git add "$filename"
    git commit -m "${strand} nucleotide ${number} - ${base} detailed structure"
}

# Enhanced function to add detailed hydrogen bonds
add_detailed_hydrogen_bonds() {
    local number=$1
    local left_base=$2
    local right_base=$3
    local bonds=$4
    local bond_details=$5
    local filename="bonds_${number}.txt"
    
    cat > "$filename" << EOL
Hydrogen Bonds for Base Pair ${number} (${left_base}-${right_base}):

1. Number of Hydrogen Bonds: ${bonds}

2. Bond Details:
${bond_details}

3. Geometric Parameters:
   - Bond Lengths: 2.8-3.0 Å
   - Bond Angles: 150-170°
   - Planarity: ±0.15 Å deviation

4. Thermodynamic Properties:
   - Bond Energy: 2-3 kcal/mol per H-bond
   - Temperature Sensitivity: Breaks at 60-100°C
   - pH Sensitivity: Stable at pH 5-9
EOL
    
    git add "$filename"
    git commit -m "Detailed hydrogen bonds for pair ${number}"
}

# Create enhanced DNA structure
echo "Creating detailed nucleotide pairs..."

# A-T Pair with extended properties
AT_PROPERTIES="   - Ring Type: Purine (A) / Pyrimidine (T)
   - Molecular Weight: 135.13 g/mol (A) / 126.11 g/mol (T)
   - Absorption Max: 260 nm
   - pKa: 3.88 (A) / 9.93 (T)
   - Tautomeric Forms: Amino (A) / Keto (T)"

AT_BONDS="   - N6(A)...O4(T): 2.93 Å
   - N1(A)...N3(T): 2.85 Å
   - Van der Waals Contacts
   - Propeller Twist: 16.4°
   - Buckle: ±0.7°"

create_detailed_nucleotide 1 "Adenine" "(C5H5N5)" "Left" "$AT_PROPERTIES"
git checkout backbone-right
create_detailed_nucleotide 1 "Thymine" "(C5H6N2O2)" "Right" "$AT_PROPERTIES"
add_detailed_hydrogen_bonds 1 "Adenine" "Thymine" "2" "$AT_BONDS"
git checkout "$DEFAULT_BRANCH"
git merge --no-ff backbone-right -m "Merge pair 1 (A-T) with detailed structure"

# C-G Pair with extended properties
CG_PROPERTIES="   - Ring Type: Pyrimidine (C) / Purine (G)
   - Molecular Weight: 111.10 g/mol (C) / 151.13 g/mol (G)
   - Absorption Max: 275 nm
   - pKa: 4.45 (C) / 9.24 (G)
   - Tautomeric Forms: Amino (C) / Keto (G)"

CG_BONDS="   - O6(G)...N4(C): 2.91 Å
   - N1(G)...N3(C): 2.88 Å
   - N2(G)...O2(C): 2.86 Å
   - Propeller Twist: 15.1°
   - Buckle: ±0.4°"

create_detailed_nucleotide 2 "Cytosine" "(C4H5N3O)" "Left" "$CG_PROPERTIES"
git checkout backbone-right
create_detailed_nucleotide 2 "Guanine" "(C5H5N5O)" "Right" "$CG_PROPERTIES"
add_detailed_hydrogen_bonds 2 "Cytosine" "Guanine" "3" "$CG_BONDS"
git checkout "$DEFAULT_BRANCH"
git merge --no-ff backbone-right -m "Merge pair 2 (C-G) with detailed structure"

# Add detailed structural features
cat > structure_details.txt << EOL
Advanced DNA Structural Features:

1. Helical Parameters:
   - Major Groove Width: 22 Å
   - Major Groove Depth: 8.5 Å
   - Minor Groove Width: 12 Å
   - Minor Groove Depth: 7.5 Å
   - Helical Twist: 36° per base pair
   - Rise per Base Pair: 3.4 Å
   - Base Pairs per Turn: 10.5
   - Helical Pitch: 35.7 Å
   - Diameter: 20 Å

2. Backbone Configuration:
   - Sugar Pucker: C2'-endo (B-form)
   - Backbone Torsion Angles:
     α: -30° to -90°
     β: 150° to 180°
     γ: 30° to 90°
     δ: 120° to 150°
     ε: -150° to -180°
     ζ: -60° to -120°

3. Groove Properties:
   Major Groove:
   - Electrostatic Potential: Negative
   - Hydration: Primary spine
   - Protein Recognition: Direct readout
   
   Minor Groove:
   - Electrostatic Potential: Negative
   - Hydration: Primary and secondary spines
   - A/T Rich Regions: Narrower

4. Structural Transitions:
   - B → A Form: <75% relative humidity
   - B → Z Form: High salt, alternating CG
   - Melting Temperature Factors:
     * GC Content
     * Salt Concentration
     * pH
     * Sequence Length

5. Solvent Interactions:
   - Primary Hydration Shell: 11-12 waters/nucleotide
   - Secondary Hydration: 8-9 waters/nucleotide
   - Ion Binding Sites: Major > Minor groove
   - Spine of Hydration: Minor groove

6. Dynamic Properties:
   - Base Pair Opening: 10⁻⁴ to 10⁻⁵ s
   - Sugar Repuckering: 10⁻⁴ s
   - Backbone Motions: 10⁻⁹ to 10⁻⁶ s
   - Bending/Flexibility:
     * Persistence Length: 500 Å
     * Bending Modulus: 2.4 × 10⁻¹⁹ erg·cm
EOL

git add structure_details.txt
git commit -m "Add comprehensive structural analysis"

# Add biochemical context
cat > biochemical_properties.txt << EOL
DNA Biochemical Properties:

1. Chemical Stability:
   - Depurination Rate: 3 × 10⁻¹¹ s⁻¹
   - Deamination Rate: 1 × 10⁻¹⁰ s⁻¹
   - pH Stability Range: 5-9
   - Temperature Stability: Up to 87°C (physiol. conditions)

2. Modifications:
   - Methylation: CpG islands
   - Glycosylation: Base J
   - Oxidation: 8-oxoguanine
   - UV Damage: Thymine dimers

3. Protein Interactions:
   - Major Groove Recognition:
     * α-Helix binding
     * Zinc finger motifs
     * Leucine zippers
   - Minor Groove Recognition:
     * AT-hook proteins
     * TATA-binding proteins

4. Enzymatic Processing:
   - Polymerization Rate: 1000 nt/s
   - Proofreading: 3'→5' exonuclease
   - Unwinding Rate: 600-1000 bp/s
   - Repair Mechanisms:
     * Base excision
     * Nucleotide excision
     * Mismatch repair
     * Double-strand break repair
EOL

git add biochemical_properties.txt
git commit -m "Add detailed biochemical properties"

# Create enhanced viewer script
cat > view-dna-helix.sh << 'EOL'
#!/bin/bash
# Enhanced DNA Helix Git Art Viewer

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository. Please run this script from within the detailed-dna-art directory."
    exit 1
fi

# Function to clear screen
clear_screen() {
    clear || printf "\033c" || printf "\x1bc"
}

# Function to display viewing options
show_options() {
    echo "Enhanced DNA Helix Git Art Viewer"
    echo "================================"
    echo "1. Git history (--graph --oneline)"
    echo "2. Detailed git history (--graph with dates)"
    echo "3. Full molecular structure view"
    echo "4. Base pair details"
    echo "5. Structural analysis"
    echo "6. Biochemical properties"
    echo "7. Complete report"
    echo "8. Exit"
}

# Function to handle viewing options
view_helix() {
    case $1 in
        1)
            echo "Git history view:"
            git log --graph --oneline
            ;;
        2)
            echo "Detailed git history:"
            git log --graph --pretty=format:"%h %s %ad" --date=short
            ;;
        3)
            echo "=== Molecular Structure ==="
            cat dna_intro.txt
            echo -e "\n=== Structure Details ==="
            cat structure_details.txt
            ;;
        4)
            echo "=== Base Pair Details ==="
            for i in {1..2}; do
                echo -e "\nBase Pair $i:"
                echo "Left Strand:"
                cat "Left_${i}.txt"
                echo -e "\nRight Strand:"
                cat "Right_${i}.txt"
                echo -e "\nBond Details:"
                cat "bonds_${i}.txt"
                echo "==================="
            done
            ;;
        5)
            echo "=== Structural Analysis ==="
            cat structure_details.txt
            ;;
        6)
            echo "=== Biochemical Properties ==="
            cat biochemical_properties.txt
            ;;
        7)
            echo "=== Complete DNA Analysis Report ==="
            cat dna_intro.txt
            echo -e "\n=== Base Pairs ==="
            for i in {1..2}; do
                echo -e "\nBase Pair $i:"
                echo "Left Strand:"
                cat "Left_${i}.txt"
                echo -e "\nRight Strand:"
                cat "Right_${i}.txt"
                echo -e "\nBond Details:"
                cat "bonds_${i}.txt"
                echo "==================="
            done
            echo -e "\n=== Structural Details ==="
            cat structure_details.txt
            echo -e "\n=== Biochemical Properties ==="
            cat biochemical_properties.txt
            ;;
        *)
            echo "Invalid option"
            return 1
            ;;
    esac
    return 0
}

# Main loop
while true; do
    clear_screen
    show_options
    read -p "Select viewing option (1-8): " choice
    
    if [ "$choice" -eq 8 ]; then
        echo "Exiting viewer..."
        break
    fi
    
    clear_screen
    view_helix $choice
    echo -e "\nPress Enter to continue..."
    read
done
EOL

chmod +x view-dna-helix.sh
git add view-dna-helix.sh
git commit -m "Add enhanced DNA structure viewer script"

echo "Enhanced DNA Helix Git Art creation complete!"
echo "Current directory: $(pwd)"
echo "To view the detailed DNA structure, run: ./view-dna-helix.sh"