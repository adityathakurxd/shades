![Add a heading](https://user-images.githubusercontent.com/53579386/107047442-d3028580-67ed-11eb-9e77-f360dc352e12.png)

# SHADES - The Skin Pigment analysis app for Electrothon

## Problem-Statement:

As we all know that the world is permanently moving in online mode by all possible ways and after the end of this pandemic people will prefer **'Go online'** in every walk of life but this new era comes with many problems which need to be solved.

In the upcoming scenario of **'the new normal'**, everything is about to get digitalized. We would like you to propose a solution for the medical industry to promote touchless diagnosis.

Build a framework to **analyze the skin pigmentation** of a patient and generate a **detailed medical report** for the same. Use machine learning to study the skin color of the patient.

The evaluation will be on the basis of how detailed your report is!

Your Data-set should be trained to predict the relevant biological functioning of the person.

One of the **example** to demonstrate this is: Usually, Typhoid can cause a rash, which consists of small pink spots which are sometimes referred to as “rose spots”. Each spot tends to last around 3-5 days. You can detect those and prepare a report for the same.

## Team Details 
**Team Name:** ErrorHack

**Members:**

 - Aditya Thakur (Team Leader, Flutter Developer)
 - Vishnupriya Arora (AI/ML Student)

# Hack Progress
We broke up the problem statement into task and tried to focus on one at a time namely:

 - Getting relevant data for the ML model
 - Training and Testing the model

## Task 1 - Getting the data!
To prepare a good Machine Learning model, we first need great data!

Our first goal was to collect sufficient data to train our model with. Unfortunately for us, the data available on Skin pigmentation was limited or unordered. We looked up research papers, did searches across the Internet until we stumbled across this one great dataset **HAM10000 ("Human Against Machine with 10000 training images")**. 

**About the dataset:**
It contains collected dermatoscopic images from different populations, acquired and stored by different modalities. The final dataset consists of 10015 dermatoscopic images which can serve as a training set for academic machine learning purposes. 

Cases include a representative collection of all important diagnostic categories in the realm of pigmented lesions: 

 - actinic keratoses and intraepithelial carcinoma / Bowen's disease (akiec)
 - basal cell carcinoma (bcc)
 - dermatofibroma (df)
 - melanoma (mel)
 - melanocytic nevi (nv)
 - vascular lesions (angiomas, angiokeratomas, pyogenic granulomas and hemorrhage, vasc).
 -  benign keratosis-like lesions (solar lentigines / seborrheic keratoses and lichen-planus like keratoses, bkl)

**Citation**

[1] Noel Codella, Veronica Rotemberg, Philipp Tschandl, M. Emre Celebi, Stephen Dusza, David Gutman, Brian Helba, Aadi Kalloo, Konstantinos Liopyris, Michael Marchetti, Harald Kittler, Allan Halpern: “Skin Lesion Analysis Toward Melanoma Detection 2018: A Challenge Hosted by the International Skin Imaging Collaboration (ISIC)”, 2018; https://arxiv.org/abs/1902.03368

[2] Tschandl, P., Rosendahl, C. & Kittler, H. The HAM10000 dataset, a large collection of multi-source dermatoscopic images of common pigmented skin lesions.  _Sci. Data_ **5**, 180161 doi:10.1038/sdata.2018.161 (2018).

## Task 2 - Training and Testing the model

## Preprocessing
Data Preprocessing is that step in which the data gets transformed, or _Encoded_, to bring it to such a state that now the machine can easily parse it. In other words, the _features_ of the data can now be easily interpreted by the algorithm.

There are 7 possible labels from the dataset provider:

-   0: nv - Melanocytic nevi
-   1: mel - Melanoma
-   2: bkl - Benign keratosis-like lesions
-   3: bcc - Basal cell carcinoma
-   4: akiec - Actinic keratoses and intraepithelial carcinoma / Bowen's disease
-   5: vasc - Vascular lesions
-   6: df - Dermatofibroma

**Subtasks:**
Eliminate rows with missing data as estimating missing values would've been difficult.

# Rescaling and Reshaping
Bigger images meant more computation operations per layer as well as more memory requirements there we rescaled image pixel values to be between 0 and 1.

Each image originally was represented by a vector of length 784.
We wanted images of size 28x28, so reshaped each vector into a 2-D array of the proper size.

# Visualizing

![shades_SkinPigmentNotebook ipynb at main · adityathakurxd_shades - Google Chrome 2_6_2021 1_03_59 PM (2)](https://user-images.githubusercontent.com/53579386/107112220-f70ca800-687b-11eb-8fd1-71a95a48baf6.png)

# Train-Test Split
Next, we split the data into two sets to train and test the model respectively!

# Modeling
A 2-D convolutional neural network is used to extract features from the images while we train. 

