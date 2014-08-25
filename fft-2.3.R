fo=1000                        #fundamental frequency
w=2*pi*fo                      # radians per sec
fs=25000                       # Sample Frequency
ts=1/fs
t=seq(0,1,1/fs)
# for external data read sample data into x  i.e. x<-read.csv("xxx.csv")
#x=sin(w*t)
x=0
n=1:50
x1=sin(w*t)
x2=(1/3)*sin(3*w*t)
x3=(1/5)*sin(5*w*t)
x4=(1/7)*sin(7*w*t)
x5=(1/9)*sin(9*w*t)
x6=(1/11)*sin(11*w*t)

x=x1+x2+x3+x4+x5+x6

plot(n*ts,x1[n],"l",xlab="time (sec)",ylab="volts")
grid()

lines(n*ts,x2[n],"l",col="red")
lines(n*ts,x3[n],"l",col="blue")
lines(n*ts,x4[n],"l",col="green")
lines(n*ts,x5[n],"l",col="brown")
lines(n*ts,x6[n],"l",col="lightgreen")

# x=sin(w*t)+(1/3)*sin(3*w*t)+(1/5)*sin(5*w*t)+(1/7)*sin(7*w*t)+(1/9)*sin(9*w*t)+(1/11)*sin(11*w*t)                    # signal to be sampled
# pcf=2/(as.integer(length(x))/2)   # power correction factor
pcf=.0006399942
fcf=fs/(as.integer(length(x))) #Frequency correction factor
par(mfrow=c(3,1))
n=1:100
plot(n*1/fo/50,x[n],"l",xlab="time (sec)",ylab="volts")  #plots signal volts against time
grid()
a=abs(Re(fft(x)))
m=as.integer(length(a)/2)
ft=1:m
plot(ft,((a[ft])*pcf),"l",xlab="Frequency (Hz)",ylab="volts")  #plots power against frequency
grid()

# plot(ft,20*log10(((a[ft])*pcf)/.223),"l",xlab="Frequency (Hz)",ylab="Dbm")  #plots Dbm against frequency
grid()
