clc;
clear all;
close all;
%m=input("enter the data");
m = [1 0 1 1 0 1];
%n=input("enter the key");
n = [1 1 0 1];
keylen=length(n);%length of the divisor
msglen=length(m);%length of the original data

for i=1:keylen
    for i=0:keylen-1
        m(msglen+i)='0';%padding of zeroes
    end
    %transmitter
    msg=m;
    for k=1:msglen
        if n(1)== msg(1)
            for m=1:keylen
                msg(m)= xor(msg(m),n(m));%xor operation between divisor and data
            end
        end
        msg=circshift(msg,[0,-1]);%if zeroes are at left end we can shift no information loss
    end
    msg(msglen+1:end)=msg(1:keylen-1);%adding the remainder data to original data
    %%reciever
    mgs=msg;
    for k=1:msglen
        if n(1)== mgs(1)%the divisor are equal to message signal
            for m=1:keylen
                msg(m)=xor(mgs(m),n(m))%again performing long divison
            end
        end
    end
    mgs=circshift(mgs,[0 -1]);
end
rem=mgs
for i=0:keylen-1
    if rem[i]=='1' %if at remainder 1 is present it show an error
        flag=1;
    else
        flag=0;
    end
end
if flag==0
    fprintf("\n no error");
else
    fprintf("\n error is detected");
end

    
    
        
        
        
   

    
    