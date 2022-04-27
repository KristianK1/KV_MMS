clearvars -except values
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\laki"; %PC Kristian
%pathChi = "D:\KV_MMS_voices_repo\children_snimljeno"; %PC Kristian
%pathRussian = "D:\KV_MMS_voices_repo\mozilla4_russian_sorted"


%pathTest = "D:\KV_MMS_voices_repo\testPodaci" %kad trebas jednog - dva

%path = "C:\KV_MMS_voices_repo\mozilla_stuff"; %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\laki"; %Lenovo Kristian

foldersIgnore = ["female"];

cd citanje
files = readFilePaths(path, foldersIgnore, ".mp3");
cd ..
files = files(randperm(numel(files)));

Nfiles = size(files);
Nfiles = Nfiles(1,1);


wantedN = ;

if wantedN > Nfiles 
    N = Nfiles;
else
    N = wantedN;
end

"Obradit ce se " + N + " datoteka"
rezs = zeros(1,4);
rezs_O1 = zeros(1,4);
rezs_O2 = zeros(1,4);
rezs_O3 = zeros(1,4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
showFigures = 0


for i = 1:N
    if mod(i,100)== 0 && i~=0
        i/N
    end
    
    if showFigures
        "Naziv fajla" + files(i,1)
    end
    
    try
        probs = Odluka(files(i,1), values);
    catch e
        e
        "neka greska"
        continue
    end

    if showFigures
        figure(333)
        subplot(2,3,1);
        bar(probs(1,:))
        subplot(2,3,2);
        bar(probs(2,:))
        subplot(2,3,3);
        bar(probs(3,:))
    end
    
    [~,I] = max(probs(1,:),[],'all','linear');
    rezs_O1(1,I) = rezs_O1(1,I) + 1;

    [~,I] = max(probs(2,:),[],'all','linear');
    rezs_O2(1,I) = rezs_O2(1,I) + 1;
    
    [~,I] = max(probs(3,:),[],'all','linear');
    rezs_O3(1,I) = rezs_O3(1,I) + 1;

    t1 = 0.6;
    t2 = 0.78;
    t3 = 0.3;

    probs = (t1 * probs(1,:) + t2 * probs(2,:) + t3 * probs(3,:)) / (t1 + t2 + t3);

    if showFigures
        probs
        subplot(2,3,4);
        bar(probs)
    end
    
    
    
    if showFigures
        subplot(2,3,5);
        bar(probs)
        pause(5)
    end


    %gdje je najveca vjerovatnost
    [~,I] = max(probs,[],'all','linear');

    rezs(1,I) = rezs(1,I) + 1;
end


rezs_O1 = rezs_O1 / sum(rezs_O1)
rezs_O2 = rezs_O2 / sum(rezs_O2)
rezs_O3 = rezs_O3 / sum(rezs_O3)
rezs = rezs / sum(rezs)