# AMS-Anomaly-Dataset

## 🚀 Overview
The **AMS-Anomaly-Dataset** is an open-source collection of well-structured data curated for anomaly detection in analog and mixed-signal (AMS) circuits. This dataset aims to empower researchers and engineers to develop, benchmark, and evaluate models for anomaly detection, especially in automotive System-on-Chip (SoC) applications. It provides a comprehensive set of signals covering various types of faults, parametric variations, and environmental conditions across multiple AMS circuit types.

### 📜 Background
AMS circuits are integral to automotive SoCs, acting as bridges between continuous analog signals and digital logic. However, these circuits are susceptible to issues like **parametric faults**, **open/short circuit faults**, and **operating region anomalies**, which can compromise functional safety (FuSa) and reliability. This dataset provides a structured repository of AMS circuit data to help researchers standardize and improve machine learning (ML) models for fault detection and anomaly analysis.


## 📊 Dataset Components and Fault Scenarios
The dataset consists of the following key AMS components, each characterized by various fault injection scenarios:

1. **Analog-to-Digital Converters (ADCs)**:
   - **Faults Simulated**: Short circuits, open circuits, temperature sweeps, and bit-level anomalies during conversion.
   - **Applications**: Vital for translating real-world analog signals into digital values within SoCs.

2. **Digital-to-Analog Converters (DACs)**:
   - **Faults Simulated**: Bulk parametric faults, temperature-induced variations, open and short circuits at various resistance values.
   - **Applications**: Essential for providing precise analog outputs based on digital inputs in automotive electronics.

3. **Operational Amplifiers (OpAmps)**:
   - **Data Types**: AC Parametric Features, DC Parametric Features, and Raw Temperature Gain Data.
   - **Faults Simulated**: Gain errors, non-linearity, and saturation-region anomalies.
   - **Applications**: Core components for signal amplification in various control and signal processing systems.

4. **Voltage Reference (VRef) Circuits**:
   - **Faults Simulated**: Linear region faults, open faults, short faults, and temperature-related parametric shifts.
   - **Applications**: Serve as stable reference points for other analog circuits within the SoC.

   
## 🗂️ Directory Structure
The dataset is organized into the following directory structure, capturing both **RAW** and **Feature-Extracted** data from key AMS components:


## Root Directory

- **Files and Folders:**
  - `ADC/`
  - `DAC/`
  - `OPAMP/`
  - `VRef/`
  - `README.md`
  - `struct.txt` (this file)

---

## ADC (Analog-to-Digital Converter)

The ADC directory contains data organized by test type and condition.

### 1. Non-Anomalous Data
- **Location:** `ADC/NON-Anomalous/`
- **Details:**  
  - Contains a single CSV file (`Non_anomalous.csv`) that provides baseline ADC performance data.

### 2. Short Transistor Tests (`shorttrans`)
- **Location:** `ADC/shorttrans/`
- **Subdirectories:**  
  - `1stbit`
  - `1stbitmux`
  - `3rdbitand`
  - `4thbitand`
  - `4thbitmux`
- **Details:**  
  - Each subdirectory holds multiple CSV files named after resistor values (e.g., `100000.csv`, `10000ohm.csv`, `100M.csv`, etc.), representing different resistor configurations and test conditions.

### 3. Temperature Sweep Tests (`tempsweep`)
- **Location:** `ADC/tempsweep/`
- **Subdirectories:**  
  - **Anomalous:**  
    - Files such as `-100C.csv`, `130C.csv`, `135C.csv`, up to `200C.csv` and several negative temperatures (e.g., `-45C.csv` to `-95C.csv`) indicate temperature values that fall outside the traditional operating range.
  - **Non_Anomalous:**  
    - Files with more typical temperatures (e.g., `0C.csv`, `10C.csv`, `25C.csv`, up to `95C.csv`, including moderate negative values) provide baseline temperature performance data.
- **Note:**  
  - For temperature measurements, any value not traditionally observed is flagged as anomalous.

### 4. Transistor Tests (`trans`)
- **Location:** `ADC/trans/`
- **Subdirectories:**  
  - `1stbit`
  - `1stbitmux`
  - `3rdbitand`
  - `4thbitand`
  - `4thbitmux`
- **Details:**  
  - Each folder contains CSV files labeled with voltage or parameter indicators (e.g., `0.3PV.csv`, `0.6PV.csv`, `0PV.csv`, etc.), reflecting different test conditions for transistor switching and analysis.

---

## DAC (Digital-to-Analog Converter)

The DAC directory houses various types of test data, arranged by testing method and condition.

### 1. Bulk Data
- **Location:** `DAC/bulk/`
- **Subdirectories:**  
  - **N1:**  
    - Contains CSV files with labels such as `0.2PV.csv`, `1.1PV.csv`, etc., representing one set of parameters.
  - **P1:**  
    - Contains CSV files with labels like `1.2NV.csv`, `1.5NV.csv`, etc., representing a different configuration (possibly complementary or negative values).

### 2. Open and Short Circuit Data
- **Location:** `DAC/DAC Open and Short Circuit Data/`
- **Subdirectories:**  
  - Organized by resistor values: `100K OHM`, `100M OHM`, `100 OHM`, `10K OHM`, `10M OHM`, `1G OHM`, `1K OHM`, `1M OHM`
- **Details:**  
  - Each folder contains CSV files (e.g., `T10.csv`, `T11.csv`, `T12.csv`, `T7.csv`, `T9.csv`) recording the behavior under open and short circuit test conditions.

### 3. Temperature Data
- **Location:** `DAC/DAC Temperature Data/`
- **Subdirectories:**  
  - **Anomalous:**  
    - Contains CSV files with out-of-range temperature values (e.g., `-100C.csv`, `125C.csv`, `130C.csv`, etc.).
  - **Non_anomalous:**  
    - Contains CSV files with typical temperature values (e.g., `0C.csv`, `10C.csv`, `100C.csv`, etc.).

### 4. Non-Anomalous Data
- **Location:** `DAC/Non_anomalous/`
- **Details:**  
  - A single CSV file (`Non_anomalous.csv`) serves as the reference dataset for normal DAC operation.

---

## OPAMP (Operational Amplifier)

The OPAMP directory is divided into sections that capture both anomalous behavior and cascade amplifier performance.

### 1. Anomalous Data by Device Type
- **Anomalous_Nfet:**  
  - **Location:** `OPAMP/Anomalous_Nfet/SingleStage/`
  - **Files Include:**  
    - `FreqAnalysisA.csv` (frequency analysis)  
    - `GainA.csv` (gain measurements)  
    - `Temp_N60_150_A.csv` (temperature response)  
    - `TransientACA.csv` and `TransientDCA.csv` (transient analysis)
- **Anomalous_Pfet:**  
  - **Location:** `OPAMP/Anomalous_Pfet/SingleStage/`
  - **Files Include:**  
    - `FreqAnalysisP.csv` (frequency analysis)  
    - `Temp_N60_150_P.csv` (temperature response)  
    - `TransientACP.csv` and `TransientDCP.csv` (transient analysis)

### 2. Cascade Amplifier Data
- **Location:** `OPAMP/CascadeAmp/Single_Stage/`
- **Files Include:**  
  - `FeqAnalysisN.csv` (frequency analysis)  
  - `Temp_N60_150_N.csv` (temperature response)  
  - `TransientACN.csv` (transient analysis)

---

## VRef (Voltage Reference)

The VRef directory categorizes test data based on operational regions and fault types.

### 1. Linear Region Analysis
- **Location:** `VRef/LinearRegion/`
- **Files Include:**  
  - `VRef_LinearRegion_InputAnalysis.csv`  
  - `VRef_LinearRegion_TempAnalysis.csv`  
  - `VRef_LinearRegion_TransientAnalysis.csv`

### 2. Open Faults Analysis
- **Location:** `VRef/OpenFaults/`
- **Files Include:**  
  - `VRef_OpenFault_InputAnalysis.csv`  
  - `VRef_OpenFault_OpenFaults.csv`  
  - `VRef_OpenFault_TempAnalysis.csv`

### 3. Parametric Fault Temperature Analysis
- **Location:** `VRef/ParametricFault_Temp/`
- **File:**  
  - `VRef_TempFault.csv`

### 4. Short Faults Analysis
- **Location:** `VRef/ShortFaults/`
- **Files Include:**  
  - `VRef_ShortFault_InputAnalysis.csv`  
  - `VRef_ShortFault_ShortFaults.csv`  
  - `VRef_ShortFault_TempAnalysis.csv`


## 📈 Anomaly Injection and Simulation Methodology
The dataset includes comprehensive data reflecting:
- **Field-effect Transistors (FETs) Anomalous Behavior**: Simulated operation in triode/linear regions instead of the expected saturation region.
- **Parametric Faults**: Variations induced by temperature shifts outside the ideal range (-40°C to 125°C).
- **Open and Short Faults**: Faults modeled using varying resistances, representing different open or short circuit conditions across terminals.

## 🤖 GAN-based Data Augmentation
To address data imbalance issues and enhance the quality of training datasets, **Generative Adversarial Networks (GANs)** were employed to generate synthetic anomaly data. The GAN-based augmentation strategy achieves up to a **Correlation Similarity Score of 0.96**, indicating the high fidelity of the generated data with respect to real-world conditions.


<!-- ## 🔍 Research Paper and Citation
If you use this dataset, please cite the research paper:

To ADD -->



## License
This dataset is provided under the MIT License.

## Contact
For any questions or issues, please contact the dataset maintainers at sanjay.das@utdallas.edu