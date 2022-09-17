## horsenettle
This repository contains the protocols, data, and code used in a study comparing temperature tolerance traits in populations of horsenettle from Texas and Minnesota.  
This README.md was created 2022-09-16 by Emma K. Chandler

## General Information
1. Data and R code: Intraspecific variation of temperature tolerance in Solanum carolinenses (horsenettle)
2. Author Information:

Emma K. Chandler, Department of Biological Sciences, Dept. 2715, North Dakota State University, PO Box 6050, Fargo, ND 58108-6050, ORCiD: 0000-0002-6507-1091

Corresponding Author: Steven E. Travers, Department of Biological Sciences, Dept. 2715, North Dakota State University, PO Box 6050, Fargo, ND 58108-6050, steven.travers@ndsu.edu, ORCiD: 0000-0001-5679-8064

3. Data collected from January 2021 through November 2021
4. Data collected at North Dakota State University
5. Information about funding sources: No direct funding sources

## Sharing and Access Information
1. Restrictions placed on data:
2. Links to publication that cite data: E.K. Chandler and S.E. Travers. Evidence of local adaptation in temperature tolerance traits of the gametophytic and sporophytic stages in Solanum carolinense (horsenettle)(in review for publication)
3. Recommended citation for the data:

E.K. Chandler and S.E. Travers. Data and R Code to Support: Evidence of local adaptation in temperature tolerance traits of the gametophytic and sporophytic stages in Solanum carolinense (horsenettle).

______________
## Data and File Overview
A. File folder data  
   1. File folder LICOR_PS: raw files and csv files with net photosynthesis data from measurments taken with the LI-6400 infrared gas analyzer
   2. File folder pilotdata: csv files with data from pilot study
        * Filename chlorophyll.csv: chlorophyll content measurements used to calculate chlorophyll stability for a heat treatment
        * Filename membraneStability.csv: conductivity measurements used to calculate cell membrane stability for a heat treatment
        * PollenGerm.csv: calculated values for thermal performance curves for pollen germination
        * pollenTube_data.csv: pollen counts for germination and pollen tube length statistics for pollen tube growth rate
   3. File folder processed: files with processed data (data manipulation and calculated parameters from R scripts included in data sheets)
        * Filename C.CHPL.csv: cold chlorophyll stability
        * Filename H.CHPL.csv: hot chlorophyll stability
        * Filename C.CMS.csv: cold cell membrane stability
        * Filename H.CMS.csv: hot cell membrane stability
        * Filename CPS.csv: cold photosynthesis
        * Filename HPS.csv: hot photosynthesis
        * Filename germParams.csv: pollen germination thermal performance curve parameters
        * Filename ptgrParams.csv: pollen tube growth rate thermal performance curve parameters
        * Filename correlation.csv: file with calculated values of all sporophytic variables for each individual plant
        * Filename correlationFull.csv: file with calculated values of all sporophytic and gametophytic variables for each individual plant
   4. Filename chlorophyll_cold.csv: chlorophyll content measurements for calculating cold chlorophyll stability
   5. Filename chlorophylldata.csv: chlorophyll content measurements for calculating hot chlorophyll stability
   6. Filename CMS_cold.csv: conductivity measurements for calculating cold cell membrane stability
   7. Filename CMSdata.csv: conductivity measurements for calculating hot cell membrane stability
   8. Filename leaf_mass.csv: mass of 10 leaf rounds (used to determine if leaf thickness differed between populations for cell membrane stability measurements)
   9. Filename MN_TX_TempComparisons.csv: summary daily temperature data (NOAA) and flowering data (iNaturalist) for Texas and Minnesota 
   10. Filename photosynthesis.csv: initial and final photosynthesis measurements for the hot and cold treatments
   11. Filename PollenGerm_parameters.csv: pollen counts for germination and pollen tube length statistics for pollen tube growth rate
   
B. File folder pilot_programs: R code for analyzing data from pilot study

C. File folder pollentube2021: pictures of petri dishes (agar growth medium) with pollen from five temperature treatments

D. File folder programs: R code for greenhouse design and analyzing data  
   1. Filename 1_greenhouse_design.R: code for random placement of plants in greenhouse
   2. Filename 2_HCMS.Rmd: code for analyzing hot cell membrane stability data
   3. Filename 3_HCHPL.Rmd: code for analyzing hot chlorophyll stability data
   4. Filename 4_CCHPL.Rmd: code for analyzing cold chlorophyll stability data
   5. Filename 5_CCMS.Rmd: code for analyzing cold cell membrane stability data
   6. Filename 6_PS.Rmd: code for analyzing hot and cold net photosynthesis data
   7. Filename 7_sporophyticCorrelation.Rmd: code for analyzing correlations between sporophytic variables
   8. Filename 8_PCA_SporLocation.Rmd: code for PCA of sporophytic variables divided by region (location)
   9. Filename 9_PCA_SporPopulation.Rmd: code for PCA of sporophytic variables divided by population
   10. Filename 10_MASS.Rmd: code for analyzing leaf mass to determine if leaf thickness differs by region
   11. Filename 11_Pollen_TPC.Rmd: code for thermal performance curve (TPC) for pollen germination and pollen tube growth rate
   12. Filename 12_PollenGermFigures.Rmd: code for creating figures from pollen germination TPC
   13. Filename 13_PollenTubeGrowthRate.Rmd: code for creating figures from pollen tube growth rate TPC
   14. Filename 14_FullCorrelation.Rmd: code for correlation analysis of all sporophytic variables and gametophytic variables
   15. Filename 15_FullPCA.Rmd: code for PCA with all gametophytic and sporophytic variables divided by region
   16. Filename 16_FullPCA_population.Rmd: code for PCA with all gametophytic and sporophytic variables divided by population
   17. Filename 17_StackedSporophyticFigures.Rmd: code for creating stacked sporophytic figures used for publication
   18. Filename 18_StackedGametophyticFigures.Rmd: code for creating stacked gametophytic figures used for publication
   19. Filename 19_PCA_GamLocation.Rmd: code for PCA with only gametophytic variables divided by location
   20. Filename 20_BlockEffectsCMS_OutsideTemps.Rmd: code for analysis of block effects in cell membrane stability and figures including outside temperature
   21. File folder figures: figure outputs from all files listed above

E. File folder Protocols: documents with protocols for measuring and calculating each variable included in this project

________________
## Data information for: chlorophyll_cold.csv
1. Number of variables: 11
2. Number of plants/rows: 196
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * pair: pair number for pairings between a southern and northern plant that initiated growth at the same time and were always placed next to one another in the greenhouse
  * treatment_initial: initial chlorophyll content measurement prior to cold treatment
  * treatment_final: final chlorophyll content measurement after cold treatment
  * control_initial: initial chlorophyll content measurement prior to control treatment
  * control_final: final chlorophyll content measurement after control treatment

## Data information for: chlorophylldata.csv
1. Number of variables: 11
2. Number of plants/rows: 196
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * pair: pair number for pairings between a southern and northern plant that initiated growth at the same time and were always placed next to one another in the greenhouse
  * treatment_initial: initial chlorophyll content measurement prior to hot treatment
  * treatment_final: final chlorophyll content measurement after hot treatment
  * control_initial: initial chlorophyll content measurement prior to control treatment
  * control_final: final chlorophyll content measurement after control treatment

## Data information for: CMS_cold.csv
1. Number of variables: 11
2. Number of plants/rows: 196
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * pair: pair number for pairings between a southern and northern plant that initiated growth at the same time and were always placed next to one another in the greenhouse
  * exp_trt: conductivity measurement after cold treatment
  * exp_max: conductivity measurement after maximum damage treatment for group in cold treatment
  * cntr_trt: conductivity measurement after control treatment
  * cntr_max: conductivity measurement after maximum damage treatment for group in control treatment

## Data information for: CMSdata.csv
1. Number of variables: 11
2. Number of plants/rows: 196
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * pair: pair number for pairings between a southern and northern plant that initiated growth at the same time and were always placed next to one another in the greenhouse
  * exp_trt: conductivity measurement after hot treatment
  * exp_max: conductivity measurement after maximum damage treatment for group in hot treatment
  * cntr_trt: conductivity measurement after control treatment
  * cntr_max: conductivity measurement after maximum damage treatment for group in control treatment

## Data information for: leaf_mass.csv
1. Number of variables: 9
2. Number of plants/rows: 104
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (2 per genet measured)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * pair: pair number for pairings between a southern and northern plant that initiated growth at the same time and were always placed next to one another in the greenhouse
  * mass_T: mass of 10 leaf rounds from the treatment group used for CMS measurements
  * mass_C: mass of 10 leaf rounds from the control group used for CMS measurments

## Data information for: MN_TX_TempComparison.csv
1. Number of variables: 7
2. Number of plants/rows: 365
3. Missing data: none
4. Variable list
  * DOY: day of the year
  * Txmax: average maximum daily temperature for 2018-2021 in Collin County Texas
  * Txmax: average minimum daily temperature for 2018-2021 in Collin County Texas
  * Mnmax: average maximum daily temperature for 2018-2021 in Houston County Minnesota
  * Mnmax: average minimum daily temperature for 2018-2021 in Houston County Minnesota
  * TXflwr: day when horsenettle plant was observed flowering on iNaturalist in Texas
  * MNflwr: day when horsenettle plant was observed flowering on iNaturalist in Minnesota

## Data information for: photosynthesis.csv
1. Number of variables: 11
2. Number of plants/rows: 188
3. Missing data: missing data for plants with leaves that were too small, with missing leaves, or dead
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * block: temporal blocking, numbered in order of the week plants initiated growth
  * CPS_i: initial net photosynthesis measurement prior to cold treatment
  * CPS_f: final net photosynthesis measurement after cold treatment
  * HPS_i: initial net photosynthesis measurement prior to hot treatment
  * HPS_f: final net photosynthesis measurement after hot treatment
  * notes: notes about problematic measurements due to equiptment problems

## Data information for: pollenTube_NEW.csv
1. Number of variables: 15
2. Number of plants/rows: 305
3. Missing data: none
4. Variable list
  * population: origin population of plant
  * location: origin region/location of plant (north vs south)
  * number: plant number within population
  * ID: plant ID including population abbreviation and number
  * ramet: designation of ramet (4 per genet)
  * temp: temperature treatment in degrees celcius
  * no_tubes: number of pollen grains counted on one picture per plate with no pollen tube
  * tubes: number of pollen grains counted on one picture per plate with a pollen tube
  * total_grains: total number of pollen grains counted on one picture per plate
  * mean_length: mean length of the 20 longest pollen tubes on 4 pictures per plate
  * median_length: median length of the 20 longest pollen tubes on 4 pictures per plate
  * sd_length: standard deviation of the length of the 20 longest pollen tubes on 4 pictures per plate
  * se_length: standard error of the length of the 20 longest pollen tubes on 4 pictures per plate
  * max_length: length of the longest pollen tube of the 20 longest pollen tubes on 4 pictures per plate
  * time: number of hours the plate with pollen grains was at the treatment temperature
