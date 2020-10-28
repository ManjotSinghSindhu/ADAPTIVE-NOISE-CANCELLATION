%ADAPTIVE NOISE CANCELLATION 

clc;
clear all;
close all;
%ORDER OF FILTER
M=16;   
%STEP SIZE
mu=0.04; 
%ITERATIONS
N=200;         

f=750; 
Ts=1/(4*f);     
noise=(rand(N,1)-0.5); 
n=zeros(M,1); 
w=zeros(M,1); 
 
Wn=[0.1 0.5];  
[B,A]=butter(2,Wn); 
x=filter(B,A,n); 

for i=1:N    
     t=(i-1)*Ts;     

     for k=M:-1:2     
         n(k)=n(k-1);    
     end;    
     s(i)=cos(2*pi*f*t); 
     %NOISE 

n(1)=0.2*(cos(2*pi*50*t)+sin(2*pi*100*t)+cos(2*pi*60*t)+sin(2*pi*80*t)+cos(2*pi*30*t)+sin(2*pi*20*t)+sin(2*pi*10*t)+ sin(2*pi*90*t));   
d(i)=s(i)+n(1);  
x=filter(B,A,n);  
d_out(i)=w'*x;  
e(i)=d(i)-d_out(i);
w=w+mu*e(i)*x;
end;

i=1:N; 
subplot(3,1,1); 
plot(i,d,'g'); 
title('ADAPTIVE NOISE CANCELLAR');
xlabel('ITERATIONS'); 
ylabel('ANC INPUT');
axis([1 N -2 2]); 

subplot(3,1,2);
plot(i,s,'b'); 
xlabel('ITERATIONS'); 
ylabel('DESIRED OUTPUT'); 
axis([1 N -2 2]); 

subplot(3,1,3); 
plot(i,e,'r'); 
xlabel('ITERATIONS');
ylabel('ANC OUTPUT'); 
axis([1 N -2 2]); 
