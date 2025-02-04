Introduction to Fibrex project
================

## Intro

This repository covers processing and analyses of data collected Fibrex
project and contains the code necessary to reproduce the complete
statistical analysis for the article:

**Diet rich in soluble dietary fibres increases excretion of
perfluorooctane sulfonic acid (PFOS) in male Sprague-Dawley rats** (doi:
[10.1016/j.fct.2024.115041](https://doi.org/10.1016/j.fct.2024.115041)).

All files and folders should be copied to your local folder to ensure
script compliance.

## Content

Analysis covers Import and QC of sequencing data in phyloseq objects
obtained from the
[DF_GMH_PIPELINE](https://github.com/MSMortensen/DF_GMH_pipeline), as
well as relative abundance, alpha-diversity, beta-diversity and
differential abundance analyses. Demultiplexed sequence files from raw
Ion S5 sequencing data are available under [Bioproject number
950015](http://www.ncbi.nlm.nih.gov/bioproject/950015). These can be
further processed for phyloseq analysis using the
[DF_GMH_PIPELINE](https://github.com/MSMortensen/DF_GMH_pipeline).

## Steps

This repository consists of the following Rmarkdown files and following
the numbered order is encouraged:

- **1_Instructions.Rmd**: Explanation of data and instructions to
  install required packages.
- **2_Import.Rmd**: Import and QC of sequencing data.
- **3_Relative_abundance.Rmd**: Summary of the microbiome ,including
  relative abundances at all taxonomic levels.
- **4_Alpha_diversity.Rmd**: Alpha diversity, including richness
  (observed ASVs), eveness (Shannon) and phylogenetic diversity
  (FaithPD).
- **5_Beta_diversity.Rmd**: Beta diversity using Bray-Curtis, Jaccard
  and UniFrac distance matrix.
- **6_Differential_abundance.Rmd**: Differential abundance between
  treatments on Day 3, 5 and 7, and facultative anaerobe estimate.
- **7_Animal_data.Rmd**: Statistical analysis of collected quantitative
  weight, PFOS, short-chain fatty acid, gastrointestinal transit time,
  gastrointestinal pH data, and feed consumption data.

## Install packages

To use the code the following packages must be installed, if they are
already installed you can skip this part.

### GMHmicrobiome

``` r
if (!requireNamespace("remotes")) install.packages("remotes")
if (!requireNamespace("BiocManager")) install.packages("BiocManager")
if (!requireNamespace("ggrepel")) install.packages("ggrepel")
if (!requireNamespace("forcats")) install.packages("forcats")

if (!requireNamespace("GMHmicrobiome")) remotes::install_github("MSMortensen/GMHmicrobiome")
```

### DAtest add-ons

``` r
BiocManager::install(c("DESeq2","limma","edgeR","metagenomeSeq","baySeq","ALDEx2","impute","ANCOMBC"))

install.packages(c("samr","pscl","statmod","mvabund","eulerr","lsmeans"))
```

## Create the necessary output folders

``` r
# Create used folders if missing
if (!file.exists("R_objects")) dir.create(file.path(getwd(), "R_objects"))
if (!file.exists("plots")) dir.create(file.path(getwd(), "plots"))
if (!file.exists("plots/adiv")) dir.create(file.path(getwd(), "plots/adiv"))
if (!file.exists("plots/bdiv")) dir.create(file.path(getwd(), "plots/bdiv"))
if (!file.exists("plots/differential_abundance")) dir.create(file.path(getwd(), "plots/differential_abundance"))
if (!file.exists("plots/figures")) dir.create(file.path(getwd(), "plots/figures"))
if (!file.exists("plots/animal_data")) dir.create(file.path(getwd(), "plots/animal_data"))
if (!file.exists("plots/animal_data/pH")) dir.create(file.path(getwd(), "plots/animal_data/pH"))
if (!file.exists("plots/animal_data/transit")) dir.create(file.path(getwd(), "plots/animal_data/transit"))
if (!file.exists("plots/animal_data/pfos")) dir.create(file.path(getwd(), "plots/animal_data/pfos"))
if (!file.exists("plots/animal_data/weight")) dir.create(file.path(getwd(), "plots/animal_data/weight"))
if (!file.exists("plots/animal_data/scfa")) dir.create(file.path(getwd(), "plots/animal_data/scfa"))
if (!file.exists("tables")) dir.create(file.path(getwd(), "tables"))
if (!file.exists("output")) dir.create(file.path(getwd(), "output"))
if (!file.exists("tables")) dir.create(file.path(getwd(), "tables"))
if (!file.exists("scripts")) dir.create(file.path(getwd(), "scripts"))
```
