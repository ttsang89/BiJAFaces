% % GET data frames from time_series script 
% % Monolinguals:
% % allPart_move_ave_MONO
% % 
% % Bilinguals: 
% % allPart_move_ave_BI
% % Armenian hungry 
clear all
% load('allPart_move_ave_speaker_BI.mat')
% load('allPart_move_ave_speaker_MONO.mat')

load('allPart_move_ave_head_turn_BI_2.mat')
load('allPart_move_ave_head_turn_MONO_2.mat')


A_first_Armenian_average_speaker_mono=[];
E_first_Armenian_average_speaker_mono=[];
A_first_English_average_speaker_mono=[];
E_first_English_average_speaker_mono=[];


for p = 1:length(allPart_move_ave_head_turn_MONO)
%     for speaker = 1:2
%         thisPart_speaker_mono = [allPart_move_ave_speaker_MONO{p,1}{}]
            thisPart_speaker_mono = cell2mat(allPart_move_ave_head_turn_MONO{p,1});

        if allPart_move_ave_head_turn_MONO{p,2}==1
            A_first_Armenian_average_speaker_mono= [A_first_Armenian_average_speaker_mono mean(thisPart_speaker_mono(:,1:3),2)];
            A_first_English_average_speaker_mono=[A_first_English_average_speaker_mono mean(thisPart_speaker_mono(:,4:6),2)];
        else
            E_first_Armenian_average_speaker_mono= [E_first_Armenian_average_speaker_mono mean(thisPart_speaker_mono(:,1:3),2)];
            E_first_English_average_speaker_mono=[E_first_English_average_speaker_mono mean(thisPart_speaker_mono(:,4:6),2)];
        end

end

Armenian_first_average_mono = mean(A_first_Armenian_average_speaker_mono,2);
A_first_Armenian_error_1_mono=std(A_first_Armenian_average_speaker_mono,1,2);

E_first_Armenian_average_mono = mean(E_first_Armenian_average_speaker_mono,2);
E_first_Armenian_error_2_mono=std(E_first_Armenian_average_speaker_mono,1,2);

A_first_English_average_mono = mean(A_first_English_average_speaker_mono,2);
A_first_English_error_1_mono=std(A_first_English_average_speaker_mono,1,2);
 
E_first_English_average_mono = mean(E_first_English_average_speaker_mono,2);
E_first_English_error_2_mono=std(E_first_English_average_speaker_mono,1,2);

A_first_Armenian_average_speaker_bi=[];
E_first_Armenian_average_speaker_bi=[];
A_first_English_average_speaker_bi=[];
E_first_English_average_speaker_bi=[];
 
 
for p = 1:length(allPart_move_ave_head_turn_BI)
%     for speaker = 1:2
%         thisPart_speaker_bi = [allPart_move_ave_speaker_BI{p,1}{1:6}];
        thisPart_speaker_bi = cell2mat(allPart_move_ave_head_turn_BI{p,1})
        if allPart_move_ave_head_turn_BI{p,2}==1
            A_first_Armenian_average_speaker_bi= [A_first_Armenian_average_speaker_bi mean(thisPart_speaker_bi(:,1:3),2)];
            A_first_English_average_speaker_bi=[A_first_English_average_speaker_bi mean(thisPart_speaker_bi(:,4:6),2)];
        else
            E_first_Armenian_average_speaker_bi= [E_first_Armenian_average_speaker_bi mean(thisPart_speaker_bi(:,1:3),2)];
            E_first_English_average_speaker_bi=[E_first_English_average_speaker_bi mean(thisPart_speaker_bi(:,4:6),2)];
        end
 
end
 
Armenian_first_average_bi = mean(A_first_Armenian_average_speaker_bi,2);
A_First_Armenian_error_1_bi=std(A_first_Armenian_average_speaker_bi,1,2);
 
E_first_Armenian_average_bi = mean(E_first_Armenian_average_speaker_bi,2);
E_first_Armenian_error_2_bi=std(E_first_Armenian_average_speaker_bi,1,2);
 
A_first_English_average_bi = mean(A_first_English_average_speaker_bi,2);
A_first_English_error_1_bi=std(A_first_English_average_speaker_bi,1,2);
 
E_first_English_average_bi = mean(E_first_English_average_speaker_bi,2);
E_first_English_error_2_bi=std(E_first_English_average_speaker_bi,1,2);

x=1:61;

% Monolingual AH
% color bilingual blue. think about monolingual 

figure
subplot(2,2,1)
% fill([x'; fliplr(x')],[Armenian_first_average_mono-A_first_Armenian_error_1_mono; Armenian_first_average_mono+A_first_Armenian_error_1_mono],[.3 .3 .9],'linestyle','none') ;
% hold off;
alpha(.1)
hold on; 
plot(x,Armenian_first_average_mono, '-b','LineWidth',3)
% hold on;
plot(x,Armenian_first_average_mono-A_first_Armenian_error_1_mono,'--b')
plot(x,Armenian_first_average_mono+A_first_Armenian_error_1_mono,'--b')

hold on;
% 
% fill([x'; fliplr(x')],[Armenian_first_average_bi-A_First_Armenian_error_1_bi; Armenian_first_average_bi+A_First_Armenian_error_1_bi],[.3 .9 .3],'linestyle','none') ;
% hold off;
% alpha(.1)
% hold on; 
plot(x,Armenian_first_average_bi, 'color',[0 0.741 0.44],'LineWidth',3)
% hold on;
plot(x,Armenian_first_average_bi-A_First_Armenian_error_1_bi,'--g')
plot(x,Armenian_first_average_bi+A_First_Armenian_error_1_bi,'--g')
xlim([0 60])
plot([0 0], [0 1], ':k')
% plot([-15 60], [0 0], '--k')
xlabel('Frame Number')
ylabel('% Looking Time to Speaker vs Listener')
title('Armenian first; Armenian Clips')

subplot(2,2,2)
% hold off;
% fill([x'; fliplr(x')],[E_first_Armenian_average_mono-E_first_Armenian_error_2_mono; flipud(E_first_Armenian_average_mono+E_first_Armenian_error_2_mono)],[.3 .3 .9],'linestyle','none') ;
% hold off;
% alpha(.1)
hold on; 
armenian_mono=plot(x,E_first_Armenian_average_mono, '-b','LineWidth',3)
% hold on;
plot(x,E_first_Armenian_average_mono-E_first_Armenian_error_2_mono,'--b')
plot(x,E_first_Armenian_average_mono+E_first_Armenian_error_2_mono,'--b')

subplot(2,2,2)

% fill([x'; fliplr(x)'],[E_first_Armenian_average_bi-E_first_Armenian_error_2_bi; flipud(E_first_Armenian_average_bi+E_first_Armenian_error_2_bi)],[.3 .9 .3],'linestyle','none') ;
% hold off;
% alpha(.1)
hold on; 
armenian_bi=plot(x,E_first_Armenian_average_bi, 'color',[0 0.741 0.44],'LineWidth',3)
% hold on;
plot(x,E_first_Armenian_average_bi-E_first_Armenian_error_2_bi,'--g')
plot(x,E_first_Armenian_average_bi+E_first_Armenian_error_2_bi,'--g')
xlim([0 60])
plot([0 0], [-.4 .4], ':k')
% plot([-15 60], [0 0], '--k')
xlabel('Frame Number')
ylabel('% Looking Time to Speaker vs Listener')
title('English First; Armenian Clips')
legend([armenian_mono armenian_bi],{'Monolingual', 'Bilingual'})

subplot(2,2,3)
% % fill([x'; fliplr(x)'],[A_first_English_average_mono-A_first_English_error_1_mono; flipud(A_first_English_average_mono+A_first_English_error_1_mono)],[.3 .3 .9],'linestyle','none') ;
% % hold off;
alpha(.1)
hold on; 
plot(x,A_first_English_average_mono, '-b','LineWidth',3)
% hold on;
plot(x,A_first_English_average_mono-A_first_English_error_1_mono,'--b')
plot(x,A_first_English_average_mono+A_first_English_error_1_mono,'--b')
 
hold on;
 
% fill([x'; fliplr(x')],[A_first_English_average_bi-A_first_English_error_1_bi; flipud(A_first_English_average_bi+A_first_English_error_1_bi)],[.3 .9 .3],'linestyle','none') ;
% hold off;
% alpha(.1)
% hold on; 
plot(x,A_first_English_average_bi, 'color',[0 0.741 0.44],'LineWidth',3)
% hold on;
plot(x,A_first_English_average_bi-A_first_English_error_1_bi,'--g')
plot(x,A_first_English_average_bi+A_first_English_error_1_bi,'--g')
xlim([0 60])
plot([0 0], [-.4 .4], ':k')
% plot([-15 60], [0 0], '--k')
xlabel('Frame Number')
ylabel('% Looking Time to Speaker vs Listener')
title('Armenian First; English Clips')

subplot(2,2,4)
% % hold off;
% % fill([x'; fliplr(x')],[E_first_English_average_mono-E_first_English_error_2_mono; flipud(E_first_English_average_mono+E_first_English_error_2_mono)],[.3 .3 .9],'linestyle','none') ;
% hold off;
% alpha(.1)
hold on; 
plot(x,E_first_English_average_mono, '-b','LineWidth',3)
% hold on;
plot(x,E_first_English_average_mono-E_first_English_error_2_mono,'--b')
plot(x,E_first_English_average_mono+E_first_English_error_2_mono,'--b')

subplot(2,2,4)

% fill([x'; fliplr(x')],[E_first_English_average_bi-E_first_English_error_2_bi; flipud(E_first_English_average_bi+E_first_English_error_2_bi)],[.3 .9 .3],'linestyle','none') ;
% hold off;
% alpha(.1)
hold on; 
plot(x,E_first_English_average_bi, 'color',[0 0.741 0.44],'LineWidth',3)
% hold on;
plot(x,E_first_English_average_bi-E_first_English_error_2_bi,'--g')
plot(x,E_first_English_average_bi+E_first_English_error_2_bi,'--g')
xlim([0 60])
plot([0 0], [-.4 .4], ':k')
% plot([-15 62], [0 0], '--k')
xlabel('Frame Number')
ylabel('% Looking Time to Speaker vs Listener')
title('English First; English Clips')





