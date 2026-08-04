dt=0.01;
t=0:dt:2;
tw=0:dt:1;
mexican_hat = @(t1) (2 / (sqrt(3) * pi^0.25)) * (1 - t1.^2) .* exp(-t1.^2 / 2);
signal =@(t) (1.2*sin(2 * pi * (10 + 20 * t))+3.7*cos(2 * pi * (40 + 12 * t))+100); % Frequency modulation
Lpf=[1/sqrt(2),1/sqrt(2)];
#Hpf=[-1/sqrt(2),1/sqrt(2)];
ln=length(t);
lf=length(tw);
val=zeros(ln+lf);
k=1
j=lf
while j>1
  k=lf+1-j
for i=1:ln
  val(k)+=min([signal(t(i)),mexican_hat(tw(j))])*dt;
  k=k+1
endfor
j=j-1

endwhile





plot(val);
