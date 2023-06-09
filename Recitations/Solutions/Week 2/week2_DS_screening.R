##################################################################
# June 8, 2023
# Ryan Wei
#
# SIBDS practice with sensitivity, specificity, NPV, PPV
##################################################################

# codes for Unit 3 Problem 6

pos_pre = 302 # 307
pos_abs = 80 # 70
neg_pre = 179 # 198
neg_abs = 372 # 400

N = pos_abs + pos_pre +neg_abs + neg_pre

prevalence = 0.10 # 0.20

# Calculate PPV NPV

# Sens, Spec
sens = (pos_pre)/(pos_pre + neg_pre)
spec = (neg_abs)/(pos_abs + neg_abs)

# P(+)
p_pos = sens * prevalence + (1 - spec) * (1 - prevalence)

# P(-)
p_neg = 1 - p_pos
p_neg_1 = spec * (1 - prevalence) + (1- sens) * prevalence 

# PPV/NPV
## PPV = P(D | +) = P(D, +) / P(+) 
PPV = sens * prevalence / p_pos
## NPV = P(not D | -) = P(not D, -) / P(-)
NPV = spec * (1 - prevalence)/ p_neg
  


prevalence = 0.20
# Calculate PPV NPV

# Sens, Spec
sens = (pos_pre)/(pos_pre + neg_pre)
spec = (neg_abs)/(pos_abs + neg_abs)

# P(+)
p_pos = sens * prevalence + (1 - spec) * (1 - prevalence)

# P(-)
p_neg = 1 - p_pos
p_neg_1 = spec * (1 - prevalence) + (1- sens) * prevalence 

# PPV/NPV
## PPV = P(D | +) = P(D, +) / P(+) 
PPV = sens * prevalence / p_pos
## NPV = P(not D | -) = P(not D, -) / P(-)
NPV = spec * (1 - prevalence)/ p_neg



## Extra stuff
calc_ppv = function(pp, pa, np, na, prev){
  Sens = pp/(pp + np)
  Spec = na/(na + pa)
  Ppos =  Sens * prev + (1-Spec) * (1- prev)
  ppv = (Sens * prev) / Ppos
  return(ppv)
}


PPV_func = calc_ppv(302, 80, 179, 372, 0.10)
PPV_func_2 = calc_ppv(302, 80, 179, 372, 0.20)
