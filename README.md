# cpu-saturation
Notes, code and plots to examine the saturation I see on a CPU. I noticed this while observing the performance of multi-threading. 
Almost the entire analysis would multi-thread and spread the work across the 8 cores. For one 
step in the vectorized gridfit a single core obviously maxed out at 100%. The CPU is used within a VM and the model name returned via 
lscpu is:

Intel(R) Xeon(R) CPU E5-2650 v3 @ 2.30GHz

Running on a Virtual Machine with RedHat Enterprise Linux

# related repository
This is realted to my private repository gridfit. I hope to eventually make this repository, or parts of it, public. 
