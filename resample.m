clear
dir('/Users/tawnytsang/Dropbox/Bilingual JA Faces/DATA/Raw Data/data/Sample_Reports_reformatted2');
% % dir('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/data');
this_part = '7685 SAMPLES.xlsx'
[data, txt, raw] = xlsread(this_part,'7685 SAMPLES','A:G');
% %  column 1: X, column 4: 2
% % Column 3: Pupil
% % Column 4: video name 
% % Column 5: frame index
% % Column 6: Saccade Index
% % Column 7: Subject ID

% % remove samples that don't correspond a clip
data = data(any(~isnan(data(:,4)),2),:);
% subjID = unique(data(:,7));
% for subj = 1:length(subjID);
%     thisSubjData = data(find(data(:,7)==subjID(subj)),:);
%     
clipOrder = unique(data(:,4), 'stable')
downSampleX = []; downSampleY = []; clipName = []; pupilSample = [];
saccIndex = []; subjID = [];
for p = 1:size(clipOrder)
    thisClip = find(data(:,4) ==clipOrder(p));
    frameLength = max(unique(data(thisClip,5)));
%     thisSubjID = ones(frameLength,1)*data(thisClip(1),7);
    thisClipX = zeros(frameLength,1);
    thisClipY = zeros(frameLength,1);
    pupil = zeros(frameLength,1);
    clip = ones(frameLength,1)*clipOrder(p);
    sacc = zeros(frameLength,1);
    n = 1;
    while n <frameLength;
%         if isempty(max(data(find(data(thisClip,7)==n),6)));
%             thisClipX(n) = -1;
%         thisClipY(n) = -1;
%         pupil(n) = -1;
%         sacc(n) = 0;
%         n=n+1;
%         else  
        thisClipX(n) = nanmean(data(thisClip(find(data(thisClip,5)==n)),1));
        thisClipY(n) = nanmean(data(thisClip(find(data(thisClip,5)==n)),2));
        pupil(n) = nanmean(data(thisClip(find(data(thisClip,5)==n)),3));
        sacc(n) = nanmean(data(thisClip(find(data(thisClip,5)==n)),6));
        n = n+1;
%         end
    end
    
    downSampleX = [downSampleX; thisClipX];
    downSampleY = [downSampleY; thisClipY];
    clipName = [clipName; clip];
    pupilSample = [pupilSample; pupil];
    saccIndex = [saccIndex; sacc];
%     subjID = [subjID; thisSubjID];
    clear thisClipX thisClipY pupil clip sacc thisClip
end
% % column 1: X
% % column 2: Y
% % Column 3: Pupil
% % Column 4: video name
% % Column 5: frame index
% % Column 6: Saccade Index
% % Column 7: Subject ID
downSampledData = [downSampleX downSampleY pupilSample clipName data(1,7)*ones(length(downSampleX),1)];
downSampledData(find(isnan(downSampledData(:,1))),1:3)=-1;
% % % % % % % 
% % ID LOST
lostBinary = zeros(length(downSampledData(:,1)), 1);
lostIndex = find(downSampledData(:,1)==-1);
lostBinary(lostIndex)=1;
downSampledData(:,8)=lostBinary;
% sacc2 = find(downSampledData(:,6)==1);
%     if sacc2(1)>1
%         downSampledData(sacc2-1,6)=1; downSampledData(sacc2+1,6)=1;
%     else
%         downSampledData(sacc2,6) = 1; downSampledData(sacc2+1,6)=1;
%     end
    
% downSampledData(lostIndex,6)=0;
% downSampledData(:,7) = lostBinary;

save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/data/matlab_down/7685_down','downSampledData');