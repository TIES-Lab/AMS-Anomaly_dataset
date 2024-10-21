# AMS-Anomaly-Dataset

## 🚀 Overview
The **AMS-Anomaly-Dataset** is an open-source collection of well-structured data curated for anomaly detection in analog and mixed-signal (AMS) circuits. This dataset aims to empower researchers and engineers to develop, benchmark, and evaluate models for anomaly detection, especially in automotive System-on-Chip (SoC) applications. It provides a comprehensive set of signals covering various types of faults, parametric variations, and environmental conditions across multiple AMS circuit types.

### 📜 Background
Analog and Mixed-Signal (AMS) circuits are integral to automotive SoCs, acting as bridges between continuous analog signals and digital logic. However, these circuits are susceptible to issues like **parametric faults**, **open/short circuit faults**, and **operating region anomalies**, which can compromise functional safety (FuSa) and reliability. This dataset provides a structured repository of AMS circuit data to help researchers standardize and improve machine learning (ML) models for fault detection and anomaly analysis.

## 🗂️ Directory Structure
The dataset is organized into the following directory structure, capturing both **RAW** and **Feature-Extracted** data from key AMS components:



    |-ADC
    |---Converted
    |-----NON-Anomalous
    |-----shorttrans
    |-------1stbit
    |-------1stbitmux
    |-------3rdbitand
    |-------4thbitand
    |-------4thbitmux
    |-----tempsweep
    |-------Anomalous
    |-------Non_Anomalous
    |-----trans
    |-------1stbit
    |-------1stbitmux
    |-------3rdbitand
    |-------4thbitand
    |-------4thbitmux
    |---RAW
    |-----NON-Anomalous
    |-----shorttrans
    |-------1stbit
    |-------1stbitmux
    |-------3rdbitand
    |-------4thbitand
    |-------4thbitmux
    |-----tempsweep
    |-------Anomalous
    |-------Non_Anomalous
    |-----trans
    |-------1stbit
    |-------1stbitmux
    |-------3rdbitand
    |-------4thbitand
    |-------4thbitmux
    |-DAC
    |---Converted
    |-----bulk
    |-------N1
    |-------P1
    |-----DAC Open and Short Circuit Data
    |-------100K OHM
    |-------100M OHM
    |-------100 OHM
    |-------10K OHM
    |-------10M OHM
    |-------1G OHM
    |-------1K OHM
    |-------1M OHM
    |-----DAC Temperature Data
    |-------Anomalous
    |-------Non_anomalous
    |-----Non_anomalous
    |---RAW
    |-----bulk
    |-------N1
    |-------P1
    |-----DAC Open and Short Circuit Data
    |-------100K OHM
    |-------100M OHM
    |-------100 OHM
    |-------10K OHM
    |-------10M OHM
    |-------1G OHM
    |-------1K OHM
    |-------1M OHM
    |-----DAC Temperature Data
    |-------Anomalous
    |-------Non_anomalous
    |-----Non_anomalous
    |-OPAMP
    |---FeatureExtractedData
    |-----DualStage
    |-------AC_Parametric_Features
    |-------DC_Parametric_Features
    |-----SingleStage
    |-------AC_Parametric_Features
    |-------DC_Parametric_Features
    |-----TrippleStage
    |-------AC_Parametric_Features
    |-------DC_Parametric_Features
    |---RawParametricTempGain
    |-----DualStage
    |-----SingleStage
    |-----TrippleStage
    |-VRef
    |---LinearRegion
    |---OpenFaults
    |---ParametricFault_Temp
    |---ShortFaults


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