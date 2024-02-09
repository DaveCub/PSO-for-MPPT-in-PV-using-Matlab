for j=2:4
    for i=1:10001
        if Sal1.signals(j).values(i)<0
             Sal1.signals(j).values(i)=0;
        end
    end
end
I1=Sal1.signals(2).values(1:10000);
V1=Sal1.signals(3).values(1:10000);
P1=Sal1.signals(4).values(1:10000);
d1=Sal1.signals(5).values(1:10000);
%--------------------------------------------------------------

% for j=1:3
%     for i=1:10001
%         if Salida.signals.values(i,j)<0
%              Salida.signals.values(i,j)=0;
%         end
%     end
% end
% I=Salida.signals.values(:,1);
% V=Salida.signals.values(:,2);
% P=Salida.signals.values(:,3);
% d=Salida.signals.values(:,4);
% 
% save('PS1_PandO4x2_005','I','V','P','d')
% 
% clear i j




% save('te','I','V','P','d')

% plot(P1)
% hold on
% plot(P2)



% for j=1:3
%     for i=1:10001
%         if Salida.signals.values(i,j)<0
%              Salida.signals.values(i,j)=0;
%         end
%     end
% end
% I=Salida.signals.values(:,1);
% V=Salida.signals.values(:,2);
% P=Salida.signals.values(:,3);
% d=Salida.signals.values(:,4);


% t5=[0:0.0005:5]';
% plot(t5,d01,t5,d005,t5,d_PSO)

% save('PS1_PandO4x2_005','I','V','P','d')

clear i j







