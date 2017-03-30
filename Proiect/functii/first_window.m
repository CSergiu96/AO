function first_window(B,O,A,f,fi,nrp,R1,R2,tip)%se folosesc toti parametrii pentru a nu se pierde dintr-o functie in alta
%B e tipul de amplificator
%o e offsetul
%A e amplitudinea
%f e frecventa
%fi e defazajul
%nrp e numarul de perioade pe care se afiseaza semnalele
%R1 R2 rezistentele 
%'B' si 'tip' sunt acelasi lucru

%---Figura de baza-%
     figure('Name','Amplificator Operational cu reactie negativa',...
            'Units','normalized','Position',[0.05 0.06 0.9 0.8],...
            'NumberTitle','off','color',[0,0.20,0.5]);   

%--Butoane si grupuri de butoane--%
 
     %--Grup mare--%
     BigGroup=uibuttongroup('Visible','on',...
              'BackgroundColor',[0.55,0.75,0.75],...
              'ForegroundColor','black','Title',...
              'Amplificator Operational cu reactie negativa',...
              'FontSize',10,'TitlePosition','centertop',...
              'Tag','radiobutton','Position',[0.55 0.07 0.4 0.38]); 
  
     %--Tip--%
     %-------%
     SmallGroup1=uibuttongroup('Visible','on',...
                'BackgroundColor',[0.55,0.75,0.75],...
                'ForegroundColor','black','Title','Tip : ',...
                'FontSize',7,'TitlePosition','centertop','Tag',...
                'pushbutton','Position',[0.56 0.08 0.15 0.33]);
     %--Inversor--daca e apasat apare poza cu amplificator Inversor 
     uicontrol('Style','pushbutton','Units','normalized',...
                         'Position',[0.1 0.8 0.8 0.18],'String','Amplificator Inversor',...
                         'Callback','ims(1);grafic(O,A,f,fi,nrp,R1,R2,1);tip=1','Parent',SmallGroup1);
     %--Neinversor--daca e apasat apare poza cu amplificator Nenversor 
     uicontrol('Style','pushbutton','Units','normalized',...
                         'Position',[0.1 0.56 0.8 0.18],'String','Amplificator Neinversor',...
                         'Callback','ims(2);grafic(O,A,f,fi,nrp,R1,R2,2);tip=2','Parent',SmallGroup1);    
     %--Repetor--...
     uicontrol('Style','pushbutton','Units','normalized',...
                         'Position',[0.1 0.32 0.8 0.18],'String','Repetor',...
                         'Callback','ims(3);grafic(O,A,f,fi,nrp,R1,R2,3);tip=3','Parent',SmallGroup1);
     %--Repetor inversor--..
   %  uicontrol('Style','pushbutton','Units','normalized',...
   %                      'Position',[0.1 0.08 0.8 0.18],'String','Repetor Inversor',...
   %                      'Callback','ims(4);grafic(O,A,f,fi,nrp,R1,R2,4);tip=4','Parent',SmallGroup1);  
                                 
     %--R1 & R2--%
     %-----------%
     SmallGroup2=uibuttongroup('Visible','on',...
                'BackgroundColor',[0.55,0.75,0.75],...
                'ForegroundColor','black','Title','Proprietati fizice : ',...
                'FontSize',7,'TitlePosition','centertop','Tag',...
                'pushbutton','Position',[0.72 0.16 0.22 0.25]); 
     %--R1--%       
     uicontrol('Style','text','Units','normalized',...
         'Position',[0.01 0.84 0.24 0.17],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','R1','Parent',SmallGroup2); 
     E01=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.26 0.84 0.24 0.17],'foregroundcolor','b',...
         'Callback','R1=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip);','Parent',SmallGroup2);
     set(E01,'String',num2str(R1));
     %--R2--%
     uicontrol('Style','text','Units','normalized',...
         'Position',[0.01 0.55 0.24 0.22],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','R2','Parent',SmallGroup2); 
     E02=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.26 0.55 0.24 0.22],'foregroundcolor','b',...
         'Callback','R2=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip);','Parent',SmallGroup2);
     set(E02,'String',num2str(R2));

     %--Vin--%
     %-------%
     SmallGroup3=uibuttongroup('Visible','on',...
                'BackgroundColor',[0.55,0.75,0.75],...
                'ForegroundColor','black','Title','Semnal Intrare : ',...
                'FontSize',7,'TitlePosition','centertop','Tag',...
                'pushbutton','Position',[0.72 0.08 0.22 0.18]);
     
     %--Variabile semnal--%
     %--A0 + A*sin(wt + fi)--%
      uicontrol('Style','text','Units','normalized',...
         'Position',[0.01 0.70 0.24 0.25],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','Offset','Parent',SmallGroup3); 
      uicontrol('Style','text','Units','normalized',...
         'Position',[0.26 0.70 0.24 0.25],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','Amplitudine','Parent',SmallGroup3); 
     uicontrol('Style','text','Units','normalized',...
         'Position',[0.51 0.70 0.24 0.25],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','Frecventa','Parent',SmallGroup3);
     uicontrol('Style','text','Units','normalized',...
         'Position',[0.76 0.70 0.24 0.25],'backgroundcolor',[0.75,0.25,0.25],...
         'foregroundcolor','black','String','Defazaj','Parent',SmallGroup3);
     
     E1=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.01 0.40 0.24 0.25],'foregroundcolor','b',...
         'Callback','O=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip)','Parent',SmallGroup3);
     set(E1,'String',num2str(O));
     E2=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.26 0.40 0.24 0.25],'foregroundcolor','b',...
         'String','2','Callback','A=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip)','Parent',SmallGroup3);
     set(E2,'String',num2str(A));
     E3=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.51 0.40 0.24 0.25],'foregroundcolor','b',...
         'String','60','Callback','f=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip)','Parent',SmallGroup3);
     set(E3,'String',num2str(f));
     E4=uicontrol('Style','edit','Units','normalized',...
         'Position',[0.76 0.40 0.24 0.25],'foregroundcolor','b',...
         'String','45','Callback','fi=str2num(get(gco,''string'')); grafic(O,A,f,fi,nrp,R1,R2,tip)','Parent',SmallGroup3);
     set(E4,'String',num2str(fi));
     
     sld=uicontrol('Style','slide','Units','normalized','Position',[0.82 0.1 0.08 0.03],...
                'Min',1,'Max',20,'Value',1,'Callback',@(src,evt)grafic(O,A,f,fi,(get(src,'value')),R1,R2,tip));
        uicontrol('Style','text','Units','normalized','Position',[0.79 0.1 0.03 0.03],...
                'backgroundcolor','g','foregroundcolor','black','String',num2str(get(sld,'Min')));
        uicontrol('Style','text','Units','normalized','Position',[0.90 0.1 0.03 0.03],...
                'backgroundcolor','g','foregroundcolor','black','String',num2str(get(sld,'Max')));
         uicontrol('Style','text','Units','normalized','Position',[0.73 0.1 0.05 0.03],...
                'backgroundcolor','g','foregroundcolor','black','String','Nr Perioade')
    f=uimenu('Label','Documentatie');
    uimenu(f,'Label','Site','Callback','site()');
     %--seturile sunt puse pentru a nu se pierde valorine din editbox dupa
     %callback
end