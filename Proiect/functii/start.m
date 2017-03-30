function start()

%--Main frame--%
    figure('Name','Amplificator Operational cu reactie negativa',...
        'Units','normalized','Position',[0.05 0.06 0.9 0.8],...
        'NumberTitle','off','color','w');
    
%--Citire si afisare imaginea de deschidere--%
    x = imread('AO.jpg');
    imshow(x,'InitialMagnification',150)
 
%--Buton de start--%
    uicontrol('Style','pushbutton','Units','normalized',...
        'Position',[0.06 0.05 0.43 0.16],'String','Start',...
        'Callback','close;first_window(0,O,A,f,fi,nrp,R1,R2,tip)');
    
%--Buton pentru documentatie--%    
    uicontrol('Style','pushbutton','Units','normalized',...
        'Position',[0.50 0.05 0.43 0.16],'String','Documentatie',...
        'Callback','close;site()');

end