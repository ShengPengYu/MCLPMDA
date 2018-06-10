clear 

load interaction
load dss
load mfs

   
[D d_iter d_svp] = inexact_alm_mc(dss, 1e-4);
[M m_iter m_svp] = inexact_alm_mc(mfs, 1e-4);

DRSM = abs(D.U*D.V')
MRSM = abs(M.U*M.V')
