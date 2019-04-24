num0=5*[1 5 6];
den0=[1 0 0];
sys0=tf(num0,den0);
den=[1 6 10 8 0];
[z,p,k]=residue(num0,den0)
step(sys0)