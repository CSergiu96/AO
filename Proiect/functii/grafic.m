function grafic(O,A,f,fi,nrp,R1,R2,tip)
%O - offset
%A - amplitudine
%f - frecventa
%fi - defazaj
%nrp - nr de perioade pe care se afiseaza

T=1/f; %calculam perioada semnalelor
t=0:0.001:nrp*T; %alegem un interval de timp de reprezentare
ph1=fi*pi/180; %calculam primul defazaj transormare in rad

uicontrol('Style','text','Units','normalized',...
         'Position',[0.84 0.35 0.09 0.04],'backgroundcolor',[0.75,0.55,0.25],...
         'String','Amplificare','foregroundcolor','black'); 
AM=uicontrol('Style','text','Units','normalized',...
         'Position',[0.84 0.30 0.09 0.04],'backgroundcolor',[0.75,0.55,0.25],...
         'foregroundcolor','black'); 
     
subplot(221);
x=O+A*sin(2*pi*f*t+ph1); %calculam semnalul
plot(t,x,'-or'); %afisam primul sinus
grid on;
title('Semnal intrare');%atribuim un titlu graficului
xlabel('timp [s]'); %scriem text pe axa x
ylabel('Amplitudine [V]'); %scriem text pe axa y



if (tip == 1)
    Am=R2/R1*(-1);
    subplot(223);
    y=x*Am;
    plot(t,y,'-or'); 
    grid on;
    title('Semnal iesire(amplificat)');
    xlabel('timp [s]');
    ylabel('Amplitudine [V]'); 
    set(AM,'String',num2str(Am));
else
    if (tip == 2)
        Am=1+R2/R1;
        subplot(223);
        y=x*Am;
        plot(t,y,'-or'); 
        grid on;
        title('Semnal iesire(amplificat)');
        xlabel('timp [s]'); 
        ylabel('Amplitudine [V]'); 
        set(AM,'String',num2str(Am));
     else
         if (tip == 3)
            Am=1;
            subplot(223);
            y=x*Am;
            plot(t,y,'-or'); 
            grid on;
            title('Semnal iesire(amplificat)');
            xlabel('timp [s]'); 
            ylabel('Amplitudine [V]'); 
            set(AM,'String',num2str(Am));
         else
            if (tip == 4)
                Am=-1;
                subplot(223);
                y=x*Am;
                plot(t,y,'-or'); 
                grid on;
                title('Semnal iesire(amplificat)');
                xlabel('timp [s]'); 
                ylabel('Amplitudine [V]'); 
                set(AM,'String',num2str(Am));
            end
         end
     end
end