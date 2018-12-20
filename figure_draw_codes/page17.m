function page17
deltax=linspace(0,0.8,40);%set the whole length of the graph and cut them into several segments
%by observing the approximate function  generate the points in the correspongding vector 
deltat1=deltax*0.6;
deltat2=deltax;
deltat3=1.2*deltax.^2;
deltat4=0.5*deltax.^2;
deltat5=0.3*deltax.^2;
hold on
%continuouly draw every function
plot(deltax,deltat1,'Marker','.','MarkerIndices',[1,10,20,30],'LineStyle','--','Color','k')
plot(deltax,deltat2,'Marker','.','MarkerIndices',[1,10,20,30],'LineStyle','--','Color','k')
plot(deltax,deltat3,'Marker','.','MarkerIndices',[1,10,20,30],'Color','k')
plot(deltax,deltat4,'Marker','.','MarkerIndices',[1,10,20,30],'Color','k')
plot(deltax,deltat5,'Marker','.','MarkerIndices',[1,10,20,30],'Color','k')
ylabel('\Delta t')
xlabel('\Delta x')
