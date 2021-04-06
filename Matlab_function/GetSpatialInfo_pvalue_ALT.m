function Spainfo_pvalue = GetSpatialInfo_pvalue_ALT(thisCLST, Pos, SpaInfo)
randN = 100;%
infoArray = nan(randN, 1);
randArray = nan(randN, 1);
SpaInfo_Random_Array=0;

XsizeOfVideo = 720;
YsizeOfVideo = 480;
samplingRate = 30;
scaleForRateMap = 10;
binXForRateMap = XsizeOfVideo / scaleForRateMap;
binYForRateMap = YsizeOfVideo / scaleForRateMap;
% parfor randI = 1:randN
spkN = size(thisCLST.PositionLocked(thisCLST.Flag_Position_pvalue), 1);
if spkN ~= 0
    for randI = 1:randN
        %input x, y, t: position data. it must include only behavior session data.
        %t_spk: spk data time stamps. it must include only behavior session data.
        %SpaInfo : Real spatial information score
        
        x_spkR = nan(spkN, 1);
        y_spkR = nan(spkN, 1);
        t_spkR = nan(spkN, 1);
        
        occN = size(Pos.t(Pos.Flag_Position_pvalue),1);
        T=Pos.t(Pos.Flag_Position_pvalue);
        startTime =T(1);
        endTime = T(end);
        Endtime=T(end);
        if occN < 1500 %minimum value
            error('occ data must be greater than or equare to 1500');
        end
        
        for i=1:spkN
            while true
                cRand = rand();
                shift = occN * cRand; %shift amount (unit: occ)
                
                if shift > 300 && (occN-shift) > 300 % sufficiantly far from original position
                    Shift(i)=shift; % randomize the every spike's positions.
                    break;
                end
            end
        end
        t_spk=thisCLST.PositionLocked(thisCLST.Flag_Position_pvalue);
        x_spk = thisCLST.x(thisCLST.Flag_Position_pvalue);
        y_spk = thisCLST.y(thisCLST.Flag_Position_pvalue);
        t_pos=Pos.t(Pos.Flag_Position_pvalue);
        x_pos=Pos.x(Pos.Flag_Position_pvalue);
        y_pos=Pos.y(Pos.Flag_Position_pvalue);
        
        spk_index=zeros(1,length(t_spk));
        for i=1:length(t_pos)
            for j=1:length(t_spk)
                if(t_spk(j)==t_pos(i))
                    spk_index(j)=i;
                end
            end
        end
        
        spkR_index=spk_index+floor(Shift);
        outRange = spkR_index > occN;
        spkR_index(outRange) = spkR_index(outRange) - occN;
        
        for i=1:length(x_spk)
            x_spkR(i) = x_pos(spkR_index(i));
            y_spkR(i) = y_pos(spkR_index(i));
            t_spkR(i) = t_pos(spkR_index(i));
        end
        
        %%
        [occMatR, spkMatR, rawMatR, skaggsrateMatR] = abmFiringRateMap( ...
            [t_spkR, x_spkR, y_spkR], ...
            [Pos.t(Pos.Flag_Position_pvalue), Pos.x(Pos.Flag_Position_pvalue), Pos.y(Pos.Flag_Position_pvalue)], ...
            binYForRateMap, binXForRateMap, scaleForRateMap, samplingRate);
        
        SpaInfo_Random= GetSpaInfo(occMatR, skaggsrateMatR);
        SpaInfo_Random_Array(randI) = SpaInfo_Random;
        rand_Array(randI) = cRand;
    end
    
    Spainfo_pvalue = sum(SpaInfo_Random_Array > SpaInfo) / randN;
else
    Spainfo_pvalue = NaN;
end
