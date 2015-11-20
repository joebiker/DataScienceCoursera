From Data Science Track : Getting and Cleaning Data by Jeff Leek
================================================================

run_analysis.R
--------------
Training and Test data is merged as intermediate variables:
full_X 
full_Y
full_subject

These are compiled together as variable: 
one

The first three variables of _one_ are:
__Person__ - the person ID who performed the task (ie: 1, 2, etc)
__Label__ - ID of the activity performed (ie: 1, 2 ,etc)
__Description__ - Text describing the activity performed (ie: Standing, walking, etc)

The remaining variables V1 ~ V561 are as described by: __features.txt__

Futher sumarizing of the data can be found in variables:
__one_mean__ - Mean of all variables by Person, Label, Description (ordered)
__one_sd__ - Standard Deviation of all variables by Person, Label, Description (ordered)
