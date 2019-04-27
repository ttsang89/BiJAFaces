% % % Restructuring Cell as Mat for excel
clear
% load('dataMat.mat')
load('allPart_move_ave_head_turn_MONO.mat')
load('allPart_move_ave_head_turn_BI.mat')

load('allPart_move_ave_MONO.mat')
load('allPart_move_ave_BI.mat')

dataMat=allPart_move_ave_BI;
allPartdata=[];

infant_languageBG=2
% Preallocate a matrix for the participant's data
thisPartdata= zeros(12,6);
% fill in the matrix with relevant cells
for i = 1:length(dataMat)
% first column is participant ID
    thisPartdata(1:12,1)=dataMat{i,3};
%     second column is infant language bg
thisPartdata(1:12,2)=infant_languageBG;

speaker1_data = dataMat{i,1};
speaker2_data = dataMat{i,2};
% 4th column is speaker ID
thisPartdata(1:6,4)=1;
thisPartdata(7:12,4)=2;
for clip = 1:length(speaker1_data)
    if clip<=3
        video_language=0;
    else video_language=1;
    end
    thisPartdata(clip,3)=video_language;
%     truncate data to be ONSET. right now we look at 15 frames before sp1
%     or sp2 action
    speaker1_trunk=speaker1_data{clip}(16:end);
%     data are coded that if >0=looking at SP1; <=0 = Speaker2
    sp1=min(find(speaker1_trunk>=0));
    sp2=min(find(speaker1_trunk<=0));
    
    if ~isempty(sp1)
    thisPartdata(clip,5)=sp1;
    else thisPartdata(clip,5)=0;
    end
    if ~isempty(sp2)
        thisPartdata(clip,6)=sp2;
    else thisPartdata(clip,6)=0;
    end
end
clear speaker1_data speaker1_trunk;

for clip = 1:length(speaker2_data)
    if clip<=3
        video_language=0;
    else video_language=1;
    end
    thisPartdata(6+clip,3)=video_language;
%     truncate data to be ONSET. right now we look at 15 frames before sp1
%     or sp2 action
    speaker2_trunk=speaker2_data{clip}(16:end);
%     data are coded that if >0=looking at SP1; <=0 = Speaker2
    sp1=min(find(speaker2_trunk>=0));
    sp2=min(find(speaker2_trunk<=0));
    
    if ~isempty(sp1)
    thisPartdata(6+clip,5)=sp1;
    else thisPartdata(6+clip,5)=0;
    end
    if ~isempty(sp2)
        thisPartdata(6+clip,6)=sp2;
    else thisPartdata(6+clip,6)=0;
    end
end


allPartdata=[allPartdata; thisPartdata]
end

file_name = fopen('BiJAFaces_speech_data.csv','a+');
% fprintf(file_name,'%12s,%8s,%13s,%7s,%12s, %12s,\n',...
%    'SubjectID','MonovsBi','VideoLanguage','Speaker','Frame_to_SP1', 'Frame_to_SP2');

    fprintf(file_name,'%4f,%1f,%1f,%1f,%2f,%2f\n',...
         allPartdata');
% % 
      fclose(file_name);
