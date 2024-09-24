function posit= value(int,party)
     tempY=(int);
     Max=5;
     [rowY,clomnY]=size(tempY);
     p=0;
     for ir=1:1:rowY
         for jc=1:1:clomnY
             p=p+tempY(ir,jc)*Max^((ir-1)*(clomnY)+jc-1);
         end
     end
     posit=find(party==p);
end