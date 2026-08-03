
dt=0.0001;
t=0:dt:2;
tw=0:dt:0.1;
mexican_hat = @(t1) (2 / (sqrt(3) * pi^0.25)) * (1 - t1.^2) .* exp(-t1.^2 / 2);
signal = 1.2*sin(2 * pi * (10 + 20 * t))+3.7*cos(2 * pi * (40 + 12 * t))+100; % Frequency modulation
#Lpf=[1/sqrt(2),1/sqrt(2)];
#Hpf=[-1/sqrt(2),1/sqrt(2)];
ln=length(t);
lf=length(tw);
var123=zeros(ln+lf+10);

for j=1:lf
   for k=j:lf
          var123(k)+=(min([mexican_hat(tw(lf-k+1)),signal(k)]))*dt;
   endfor
endfor
for i=2:ln
  for r=i:(lf+i)
    if ((r-1)<=lf)
      var123(lf+i-1)+=(min([mexican_hat(tw(r-1)),signal(r)]))*dt;
    endif
  end
end
plot(var123);

#signal, mexican hat
# (1,end) ; (2,end)+ (1,end-1) ; (3,end) +(2, end-1)+(1, end-2);(4,end) +(3, end-1)+(2, end-2)+(1,end-3);.....;(end,)
# (2,1)+(3,2)+..+(r,r-1)+...+(lf+1,lf) ; (3,1)+(4,2)+..+(r,r-2)+...+(lf+2,lf) ; .....
