clc
close all
clear all
%start {God's name}:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fprintf('\n');
fprintf('\n');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('+++++++++++++++++++++++++In the name of God+++++++++++++++++++++++++++');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('\n');
fprintf('   This Program Performs: "FUZZY ENVIRONMENTAL RISK ASSESSMENT FERA"');
fprintf('\n');
fprintf('\n');
fprintf(' USER GUIDE:   This prgram comprises 3 parts: ');
fprintf('\n');
fprintf('\n');
fprintf('1)Input Data, 2) Fuzzy Assessment, 3)Output Presentation.');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf(' The FERA processes 2 Fields: Air and Wastewater  ');
fprintf('\n');
fprintf('\n');
fprintf(' The Field: Air Processes Concentrations of Pollutants:');
fprintf('\n');
fprintf(' CO, NO2, SO2, PM2.5, O3, H2S, Benzene, Toluene, Xylene and Ethyl Benzene. ');
fprintf('\n');
fprintf('\n');
fprintf(' The Field: Watewater Processes Concentrations of Pollutants: COD, BOD, TSS and pH  ');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');

fid1=fopen('data.docs','w');
fprintf(fid1,'++++++++++++++++++++++++++++++Criteria AQI+++++++++++++++++++++++++++\n\n');

% 
AQI=readfis('AQI');
plotfis(AQI);
fprintf(fid1,'Figure 1 represents the Criteria Air Quality Index FIS  \n\n');
% 

CO=xlsread('data','air-criteria','B2');

NO2=xlsread('data','air-criteria','C2');

SO2=xlsread('data','air-criteria','D2');

O3=xlsread('data','air-criteria','E2');

PM=xlsread('data','air-criteria','F2');

outAQI=evalfis([CO NO2 SO2 O3 PM], AQI);

fprintf('The Calculated Fuzzy Criteria AQI =  \n');
disp(outAQI);

fprintf(fid1,'The Calculated Fuzzy Criteria AQI =  \n\n');
fprintf(fid1,'%8.2f \n\n',outAQI);
fprintf(fid1,'Figure 2 illustrates the Membership Functions in Criteria AQI  \n\n');


figure;
plotmf(AQI, 'output',1);


%Start of LOOP For: Total Criteria AQI Fuzzy LEVEL
%Analysis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
disp(' ');
if (0<=outAQI)&&(outAQI<=50)
    fprintf(fid1,'Total level of Criteria AQI in Zone is:  \n');
    fprintf(fid1,'GOOD \n\n');
        fprintf('GOOD \n\n');
    sheet=1;
xlRange='K2';
A={'GOOD'};
xlswrite('data', A, sheet, xlRange);

sheet=1;
xlRange='M7';
A={'*'};
xlswrite('data', A, sheet, xlRange);
        disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');

else if (50<outAQI)&&(outAQI<=100)
       fprintf(fid1,'Total level of Criteria AQI in Zone is: \n\n');
       fprintf(fid1,'MODERATE \n\n');
               fprintf('MODERATE \n\n');

            disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
            sheet=1;
xlRange='K2';
A={'MODERATE'};
xlswrite('data', A, sheet, xlRange);

sheet=1;
xlRange='M8';
A={'*'};
xlswrite('data', A, sheet, xlRange);
    else if (100<outAQI)&&(outAQI<=150)
           fprintf(fid1,'Total level of Criteria AQI in Zone is:  \n\n');
            fprintf(fid1,'Unhealthy For Sensetive Group \n\n');
                    fprintf('Unhealthy For Sensetive Group \n\n');

                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=1;
xlRange='K2';
A={'SENSETIVE-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=1;
xlRange='M9';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                else if (150<outAQI)&&(outAQI<=200)
            fprintf(fid1,'Total level of Criteria AQI in Zone is:  \n\n');
            fprintf(fid1,'Unhealthy \n\n');
                  fprintf('Unhealthy \n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=1;
xlRange='K2';
A={'UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);
                
sheet=1;
xlRange='M10';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                else if (200<outAQI)&&(outAQI<=300)
            fprintf(fid1,'Total level of Criteria AQI in Zone is:  \n\n');
            fprintf(fid1,'Very Unhealthy \n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=1;
xlRange='K2';
A={'VERY-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=1;
xlRange='M11';
A={'*'};
xlswrite('data', A, sheet, xlRange);

        else
            fprintf(fid1,'Total level of Criteria AQI in Zone is:  \n\n');
           fprintf(fid1,'HAZARDOUS  \n\n');
                 fprintf('HAZARDOUS \n\n');

                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=1;
xlRange='K2';
A={'HAZARDOUS'};
xlswrite('data', A, sheet, xlRange);
                
sheet=1;
xlRange='M12';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                    end;
                    end;
        end;
    end;
end;
disp(' ');

%End of LOOP For: Total Criteria AQI Fuzzy LEVEL
%Analysis:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


%*******************************************************************************************
%Dominant Criteria AQI Pollutant Sellector

CO1=CO/50;
NO21=NO2/2040;
SO21=SO2/1004;
O31=O3/600;
PM1=PM/500;
AQI1=[CO1, NO21, SO21, O31, PM1];
mainAQI=sort(AQI1);
disp(mainAQI);

[b, AQIIX]=max(AQI1);

if AQIIX==1
     fprintf(fid1,'The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
    fprintf(fid1,'CO \n\n\n');
    fprintf('The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
    fprintf('CO \n\n\n');

else if AQIIX==2
         fprintf(fid1,'The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf(fid1,'NO2 \n\n\n');
      fprintf('The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf('NO2 \n\n\n');
    
    else if AQIIX==3
             fprintf(fid1,'The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf(fid1,'SO2\n\n\n');
      fprintf('The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf('SO2\n\n\n');
                
                else if AQIIX==4
            fprintf(fid1,'The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf(fid1,'O3 \n\n\n');
      fprintf('The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf('O3 \n\n\n');
    
                    else 
             fprintf(fid1,'The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf(fid1,'PM2.5 \n\n\n');
     fprintf('The Dominant Pollutant of Criteria AQI in Zone is:  \n\n');
     fprintf('PM2.5 \n\n\n');
                    end;
        end;
    end;
end;
%End of Dominant criteria AQI Sellector
%*******************************************************************************************


%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('++++++++++++++++++++++++++++++++++++BTEXHQI++++++++++++++++++++++++++++++++++++++++++');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

fprintf(fid1,'\n\n\n\n\n');

fprintf(fid1,'++++++++++++++++++++++++++++++BTEXHQI+++++++++++++++++++++++++++\n\n');

BTEXHQI=readfis('BTEXHQI');
figure;
plotfis(BTEXHQI);
fprintf(fid1,'Figure 3 represents the BTEXH Air Quality Index FIS  \n\n');

H2S=xlsread('data','BTEXH','B2');

Benzene=xlsread('data','BTEXH','C2');

Toluene=xlsread('data','BTEXH','D2');

EthylBenzene=xlsread('data','BTEXH','E2');

Xylene=xlsread('data','BTEXH','F2');

outBTEXHQI=evalfis([H2S Benzene Toluene EthylBenzene Xylene], BTEXHQI);
fprintf('The Calculated Fuzzy BTEXHQI =  \n');
disp(outBTEXHQI);

figure;
plotmf(BTEXHQI, 'output',1);


fprintf(fid1,'The Calculated Fuzzy BTEXHQI is =  \n\n');
fprintf(fid1,'%8.2f \n\n',outBTEXHQI);
fprintf(fid1,'Figure 4 illustrates the Membership Functions in BTEXHQI \n\n');
fprintf('The Calculated Fuzzy BTEXHQI is =  \n\n');
fprintf('%8.2f \n\n',outBTEXHQI);
fprintf('Figure 4 illustrates the Membership Functions in BTEXHQI \n\n');

%Start of LOOP For: Total BTEXHQI Fuzzy LEVEL
%Analysis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
disp(' ');
if (0<=outBTEXHQI)&&(outBTEXHQI<=50)
    fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
    fprintf(fid1,'GOOD  \n\n\n');
    fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
    fprintf('GOOD  \n\n\n');
        disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
sheet=2;
xlRange='J2';
A={'GOOD'};
xlswrite('data', A, sheet, xlRange);

sheet=2;
xlRange='M7';
A={'*'};
xlswrite('data', A, sheet, xlRange);

else if (50<outBTEXHQI)&&(outBTEXHQI<=100)
         fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
        fprintf(fid1,'MODERATE  \n\n\n');
        fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
        fprintf('MODERATE  \n\n\n');
            disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
            sheet=2;
xlRange='J2';
A={'MODERATE'};
xlswrite('data', A, sheet, xlRange);

sheet=2;
xlRange='M8';
A={'*'};
xlswrite('data', A, sheet, xlRange);


    else if (100<outBTEXHQI)&&(outBTEXHQI<=150)
           fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf(fid1,'Unhealthy For Sensetive Group  \n\n\n');
             fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf('Unhealthy For Sensetive Group  \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=2;
xlRange='J2';
A={'SENSETIVE-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=2;
xlRange='M9';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                
                else if (150<outBTEXHQI)&&(outBTEXHQI<=200)
            fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
             fprintf(fid1,'Unhealthy  \n\n\n');
             fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
             fprintf('Unhealthy  \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=2;
xlRange='J2';
A={'UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);
                

sheet=2;
xlRange='M10';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                else if (200<outBTEXHQI)&&(outBTEXHQI<=300)
             fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf(fid1,'Very Unhealthy \n\n\n');
             fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf('Very Unhealthy \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=2;
xlRange='J2';
A={'VERY-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=2;
xlRange='M11';
A={'*'};
xlswrite('data', A, sheet, xlRange);


        else
            fprintf(fid1,'Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf(fid1,'HAZARDOUS \n\n\n');
            fprintf('Total level of outBTEXHQI in Zone is:  \n\n');
            fprintf('HAZARDOUS \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=2;
xlRange='J2';
A={'HAZARDOUS'};
xlswrite('data', A, sheet, xlRange);

sheet=2;
xlRange='M12';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                
                    end;
                    end;
        end;
    end;
end;
disp(' ');

%End of LOOP For: Total BTEXHQI Fuzzy LEVEL
%Analysis:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


% Dominant BTEXHQI Sellector
%*******************************************************************************************
Benzene1=Benzene/50;
Toluene1=Toluene/7;
EthylBenzene1=EthylBenzene/30;
Xylene1=Xylene/100;
H2S1=H2S/1000;
BTEXHQI1=[Benzene1, Toluene1, EthylBenzene1, Xylene1, H2S1];

[c, BTEXHQIIX]=max(BTEXHQI1);

if BTEXHQIIX==1
   fprintf(fid1,'The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf(fid1,'Benzene');
fprintf('The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf('Benzene');
else if BTEXHQIIX==2
       fprintf(fid1,'The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf(fid1,'Toluene \n\n');
     fprintf('The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf('Toluene \n\n');
    
    else if BTEXHQIIX==3
            fprintf(fid1,'The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf(fid1,'EthylBenzene \n\n');
fprintf('The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf('EthylBenzene \n\n');                
                else if BTEXHQIIX==4
            fprintf(fid1,'The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf(fid1,'Xylene \n\n');
    fprintf('The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
    fprintf('Xylene \n\n');
                    else 
            fprintf(fid1,'The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
   fprintf(fid1,'H2S \n\n');
    fprintf('The Dominant Pollutant of BTEXHQI in Zone is:  \n\n\n');
   fprintf('H2S \n\n');
                    end;
        end;
    end;
end;
%End of Dominant BTEXHQI Sellector
%*******************************************************************************************

fprintf('\n\n\n\n');

%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('++++++++++++++++++++++++++++++++++++FAQI++++++++++++++++++++++++++++++++++++++++++');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

fprintf(fid1,'\n\n\n\n\n');
fprintf(fid1,'++++++++++++++++++++++++++++++FAQI+++++++++++++++++++++++++++\n\n');

fprintf('\n\n\n\n');

FAQI=readfis('FAQI');
figure;
plotfis(FAQI);
fprintf(fid1,'Figure 5 represents the Fuzzy Air Quality Index FIS  \n\n');
fprintf('Figure 5 represents the Fuzzy Air Quality Index FIS  \n\n');


outFAQI=evalfis([outAQI outBTEXHQI], FAQI);
fprintf('The Calculated FAQI =  \n');
disp(outFAQI);

figure;
plotmf(FAQI, 'output',1);

figure;
gensurf(FAQI);

fprintf(fid1,'The Calculated FAQI is=  \n\n');
fprintf(fid1,'%8.2f \n\n',outFAQI);
fprintf(fid1,'Figure 6 illustrates the Membership Functions in FAQI  \n\n');
fprintf('The Calculated FAQI is=  \n\n');
fprintf('%8.2f \n\n',outFAQI);
fprintf('Figure 6 illustrates the Membership Functions in FAQI  \n\n');


%Start of LOOP For: Total FAQI Fuzzy LEVEL
%Analysis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
disp(' ');
if (0<=outFAQI)&&(outFAQI<=50)
    fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
    fprintf(fid1,'GOOD \n\n\n');
       fprintf('Total level of outFAQI in Zone is:  \n\n');
    fprintf('GOOD \n\n\n');
        disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
        sheet=4;
xlRange='J2';
A={'GOOD'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M7';
A={'*'};
xlswrite('data', A, sheet, xlRange);


else if (50<outFAQI)&&(outFAQI<=100)
        fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
       fprintf(fid1,'MODERATE \n\n\n');
       fprintf('Total level of outFAQI in Zone is:  \n\n');
       fprintf('MODERATE \n\n\n');
            disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
            sheet=4;
xlRange='J2';
A={'MODERATE'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M8';
A={'*'};
xlswrite('data', A, sheet, xlRange);


    else if (100<outFAQI)&&(outFAQI<=150)
            fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
            fprintf(fid1,'Unhealthy For Sensetive Group \n\n\n');
            fprintf('Total level of outFAQI in Zone is:  \n\n');
            fprintf('Unhealthy For Sensetive Group \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=4;
xlRange='J2';
A={'SENSETIVE-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M9';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                else if (150<outFAQI)&&(outFAQI<=200)
            fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
           fprintf(fid1,'Unhealthy \n\n\n');
           fprintf('Total level of outFAQI in Zone is:  \n\n');
           fprintf('Unhealthy \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=4;
xlRange='J2';
A={'UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M10';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                
                else if (200<outFAQI)&&(outFAQI<=300)
            fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
            fprintf(fid1,'Very Unhealthy \n\n\n');
             fprintf('Total level of outFAQI in Zone is:  \n\n');
            fprintf('Very Unhealthy \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=4;
xlRange='J2';
A={'VERY-UNHEALTHY'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M11';
A={'*'};
xlswrite('data', A, sheet, xlRange);


        else
            fprintf(fid1,'Total level of outFAQI in Zone is:  \n\n');
            fprintf(fid1,'HAZARDOUS  \n\n\n');
            fprintf('Total level of outFAQI in Zone is:  \n\n');
            fprintf('HAZARDOUS  \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=4;
xlRange='J2';
A={'HAZARDOUS'};
xlswrite('data', A, sheet, xlRange);

sheet=4;
xlRange='M12';
A={'*'};
xlswrite('data', A, sheet, xlRange);

                
                    end;
                    end;
        end;
    end;
end;
disp(' ');
%End of LOOP For: Total FAQI Fuzzy LEVEL
%Analysis:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


fprintf(fid1,'Figure 7 represents the Surface Viewe of FAQI   \n\n');
fprintf('Figure 7 represents the Surface Viewe of FAQI   \n\n');


% Dominant FAQI Sellector
%*******************************************************************************************
outAQI1=outAQI/500;
outBTEXHQI1=outBTEXHQI/500;
FAQI1=[outAQI1, outBTEXHQI1];

[d, FAQIIX]=max(FAQI1);

if FAQIIX==1
   fprintf(fid1,'The Dominant Pollutant of FAQI in Zone is:  \n\n');
    fprintf(fid1,'AQI \n\n\n');
fprintf('The Dominant Pollutant of FAQI in Zone is:  \n\n');
    fprintf('AQI \n\n\n');
else  
        fprintf(fid1,'The Dominant Pollutant of FAQI in Zone is:  \n\n');
   fprintf(fid1,'BTEXHQI \n\n\n');
   fprintf('The Dominant Pollutant of FAQI in Zone is:  \n\n');
   fprintf('BTEXHQI \n\n\n');
    end;
%End of Dominant FAQI Sellector
%*******************************************************************************************


fprintf('\n\n\n');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('++++++++++++++++++++++++++++++++++++FWWQI++++++++++++++++++++++++++++++++++++++++++');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf(fid1,'\n\n\n\n\n');

fprintf(fid1,'++++++++++++++++++++++++++++++FWWQI+++++++++++++++++++++++++++\n\n');

fprintf('\n\n\n\n');

FWWQI=readfis('WWQI');
figure;
plotfis(FWWQI);
fprintf(fid1,'Figure 8 represents the Fuzzy WateWater Quality Index FIS  \n\n');
fprintf('Figure 8 represents the Fuzzy WateWater Quality Index FIS  \n\n');

fprintf('\n\n');

COD=xlsread('data','wastewater','B2');

BOD=xlsread('data','wastewater','C2');

TSS=xlsread('data','wastewater','D2');

pH=xlsread('data','wastewater','E2');

PM=xlsread('data','wastewater','F2');


outFWWQI=evalfis([TSS COD BOD pH], FWWQI);
fprintf(fid1,'The Calculated Fuzzy  WWQI =  \n\n');
fprintf(fid1,'%8.2f \n\n',outFWWQI);
fprintf('The Calculated Fuzzy  WWQI =  \n\n');
fprintf('%8.2f \n\n',outFWWQI);

figure;
plotmf(FWWQI, 'output',1);
fprintf(fid1,'Figure 9 illustrates the Membership Functions in FWWQI \n\n');
fprintf('Figure 9 illustrates the Membership Functions in FWWQI \n\n');

%Start of LOOP For: Total FWWQI Fuzzy LEVEL
%Analysis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
disp(' ');
if (0<=outFWWQI)&&(outFWWQI<=50)
    fprintf(fid1,'Total level of outFWWQI in Zone is:  \n\n');
     fprintf(fid1,'GOOD   \n\n\n');
       fprintf('Total level of outFWWQI in Zone is:  \n\n');
     fprintf('GOOD   \n\n\n');
        disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
        sheet=3;
xlRange='J2';
A={'GOOD'};
xlswrite('data', A, sheet, xlRange);

sheet=3;
xlRange='M7';
A={'*'};
xlswrite('data', A, sheet, xlRange);


else if (50<outFWWQI)&&(outFWWQI<=100)
         fprintf(fid1,'Total level of outFWWQI in Zone is:  \n\n');
         fprintf(fid1,'MODERATE   \n\n\n');
           fprintf('Total level of outFWWQI in Zone is:  \n\n');
         fprintf('MODERATE   \n\n\n');
            disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
            sheet=3;
xlRange='J2';
A={'MODERATE'};
xlswrite('data', A, sheet, xlRange);

sheet=3;
xlRange='M8';
A={'*'};
xlswrite('data', A, sheet, xlRange);

   
                else if (100<outFWWQI)&&(outFWWQI<=200)
             fprintf(fid1,'Total level of outFWWQI in Zone is:  \n\n');
             fprintf(fid1,'LOW QUALITY   \n\n\n');
                  fprintf('Total level of outFWWQI in Zone is:  \n\n');
             fprintf('LOW QUALITY   \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=3;
xlRange='J2';
A={'LOW-QUALITY'};
xlswrite('data', A, sheet, xlRange);

sheet=3;
xlRange='M9';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                else if (200<outFWWQI)&&(outFWWQI<=300)
            fprintf(fid1,'Total level of outFWWQI in Zone is:  \n\n');
             fprintf(fid1,'Very LOW QUALITY \n\n\n');
              fprintf('Total level of outFWWQI in Zone is:  \n\n');
             fprintf('Very LOW QUALITY \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=3;
xlRange='J2';
A={'VERY-LOW-QUALITY'};
xlswrite('data', A, sheet, xlRange);

sheet=3;
xlRange='M11';
A={'*'};
xlswrite('data', A, sheet, xlRange);

        else
             fprintf(fid1,'Total level of outFWWQI in Zone is:  \n\n');
             fprintf(fid1,'HAZARDOUS QUALIY  \n\n\n');
             fprintf('Total level of outFWWQI in Zone is:  \n\n');
             fprintf('HAZARDOUS QUALIY  \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=3;
xlRange='J2';
A={'HAZARDOUS'};
xlswrite('data', A, sheet, xlRange);

sheet=3;
xlRange='M12';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                    end;
                    end;
    end;
end;
disp(' ');

%End of LOOP For: Total FWWQI Fuzzy LEVEL
%Analysis:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

%*******************************************************************************************
%Dominant FWWQI Pollutant Sellector

COD1=COD/300;
BOD1=BOD/150;
TSS1=TSS/200;

if pH>=7
    pH1=(pH-7)/7;
else pH1=(7-pH)/7;
end;

FWWQI1=[COD1, BOD1, TSS1, pH1];

[e, FWWQIIX]=max(FWWQI1);

if FWWQIIX==1
   fprintf(fid1,'The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf(fid1,'COD \n\n\n');
   fprintf('The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf('COD \n\n\n');
    
else if FWWQIIX==2
        fprintf(fid1,'The Dominant Pollutant of FWWQI in Zone is:  \n\n');
   fprintf(fid1,'BOD \n\n\n');
     fprintf('The Dominant Pollutant of FWWQI in Zone is:  \n\n');
   fprintf('BOD \n\n\n');
   
    else if FWWQIIX==3
            fprintf(fid1,'The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf(fid1,'TSS \n\n\n');
    fprintf('The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf('TSS \n\n\n');
    
                    else 
            fprintf(fid1,'The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf(fid1,'pH \n\n\n');
    fprintf('The Dominant Pollutant of FWWQI in Zone is:  \n\n');
    fprintf('pH \n\n\n');
        end;
    end;
end;
%End of Dominant FWWQI Sellector
%*******************************************************************************************

fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf(' ENVIRONMENTAL RISK = This Part Computes FUZZY ENVIRONMENTAL RISK ASSESSMENT ');
fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf('++++++++++++++++++++++++++++++++++++FERI++++++++++++++++++++++++++++++++++++++++++');
%'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
fprintf(fid1,'\n\n\n\n\n');

fprintf(fid1,'++++++++++++++++++++++++++++++FERI+++++++++++++++++++++++++++\n\n');

fprintf('\n');
fprintf('\n');
fprintf('\n');
fprintf('\n');

FERI=readfis('FERI');
figure;
plotfis(FERI);
fprintf(fid1,'Figure 10 represents the Fuzzy Environmental Risk Index FIS  \n\n');
fprintf('Figure 10 represents the Fuzzy Environmental Risk Index FIS  \n\n');


fprintf(' FERI=  Data for Qualities: FAQI and FWWQI are processed via Fuzzy Environmental Risk Index ');
fprintf('\n');
fprintf('\n');



outFERI=evalfis([outFAQI outFWWQI], FERI);
fprintf(fid1, 'The Calculated FERI =  \n');
fprintf(fid1,'%8.2f \n\n',outFERI);


figure;
plotmf(FERI, 'output',1);
fprintf(fid1,'Figure 11 illustrates the Membership Functions in FERI \n\n');
fprintf('Figure 11 illustrates the Membership Functions in FERI \n\n');


figure;
gensurf(FERI);


%Start of LOOP For: Total outFERI Fuzzy LEVEL
%Analysis>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
disp(' ');
if (0<=outFERI)&&(outFERI<=50)
    fprintf(fid1,'Total level of outFERI in Zone is:  \n\n');
    fprintf(fid1,'LOW RISK   \n\n\n');
      fprintf('Total level of outFERI in Zone is:  \n\n');
    fprintf('LOW RISK   \n\n\n');
        disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
        sheet=5;
xlRange='J2';
A={'LOW-RISK'};
xlswrite('data', A, sheet, xlRange);

sheet=5;
xlRange='M7';
A={'*'};
xlswrite('data', A, sheet, xlRange);

else if (50<outFERI)&&(outFERI<=100)
        fprintf(fid1,'Total level of outFERI in Zone is:  \n\n');
        fprintf(fid1,'MODERATE RISK   \n\n\n');
         fprintf('Total level of outFERI in Zone is:  \n\n');
        fprintf('MODERATE RISK   \n\n\n');
            disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
            sheet=5;
xlRange='J2';
A={'MODERATE-RISK'};
xlswrite('data', A, sheet, xlRange);

sheet=5;
xlRange='M8';
A={'*'};
xlswrite('data', A, sheet, xlRange);

   
                else if (100<outFERI)&&(outFERI<=200)
            fprintf(fid1,'Total level of outFERI in Zone is:  \n\n');
            fprintf(fid1,'RELATIVELY HIGH RISK   \n\n\n');
             fprintf('Total level of outFERI in Zone is:  \n\n');
            fprintf('RELATIVELY HIGH RISK   \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=5;
xlRange='J2';
A={'RELEATIVELY-HIGH-RISK'};
xlswrite('data', A, sheet, xlRange);

sheet=5;
xlRange='M9';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                else if (200<outFERI)&&(outFERI<=300)
            fprintf(fid1,'Total level of outFERI in Zone is:  \n\n');
            fprintf(fid1,'HIGH RISK \n\n\n');
             fprintf('Total level of outFERI in Zone is:  \n\n');
            fprintf('HIGH RISK \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=5;
xlRange='J2';
A={'HIGH-RISK'};
xlswrite('data', A, sheet, xlRange);

sheet=5;
xlRange='M11';
A={'*'};
xlswrite('data', A, sheet, xlRange);

        else
            fprintf(fid1,'Total level of outFERI in Zone is:  \n\n');
            fprintf(fid1,'VERY HIGH RISK  \n\n\n');
            fprintf('Total level of outFERI in Zone is:  \n\n');
            fprintf('VERY HIGH RISK  \n\n\n');
                disp('NOTES:+++++++++++++++++++++++++++++++++++ACTIONS:');
                sheet=5;
xlRange='J2';
A={'VERY-HIGH-RISK'};
xlswrite('data', A, sheet, xlRange);

sheet=5;
xlRange='M12';
A={'*'};
xlswrite('data', A, sheet, xlRange);
                
                    end;
                    end;
    end;
end;
disp(' ');

%End of LOOP For: Total outFERI Fuzzy LEVEL
%Analysis:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<




fprintf(fid1,'Figure 12 represents the Surface viewe of Fuzzy Environmental Risk Index \n\n');
fprintf('Figure 12 represents the Surface viewe of Fuzzy Environmental Risk Index \n\n');

% Dominant FERI Sellector
%*******************************************************************************************
outFAQI1=outFAQI/500;
outFWWQI1=outFWWQI/500;
FERI1=[outFAQI1, outFWWQI1];

[f, FERIIX]=max(FERI1);

if FERIIX==1
    fprintf(fid1,'The Dominant Pollutant of FERI in Zone is:  \n\n');
   fprintf(fid1,'FAQI  \n\n\n');
   fprintf('The Dominant Pollutant of FERI in Zone is:  \n\n');
   fprintf('FAQI  \n\n\n');
else  
        fprintf(fid1,'The Dominant Pollutant of FERI in Zone is:  \n\n');
   fprintf(fid1,'FWWQI \n\n\n');
   fprintf('The Dominant Pollutant of FERI in Zone is:  \n\n');
   fprintf('FWWQI \n\n\n');
    end;
%End of Dominant FERI Sellector
%*******************************************************************************************

sheet=1;
xlRange='I2';
xlswrite('data', outAQI, sheet, xlRange);
sheet=2;
xlRange='I2';
xlswrite('data',outBTEXHQI , sheet, xlRange);
sheet=3;
xlRange='I2';
xlswrite('data', outFWWQI, sheet, xlRange);
sheet=4;
xlRange='I2';
xlswrite('data', outFAQI, sheet, xlRange);
sheet=5;
xlRange='I2';
xlswrite('data', outFERI, sheet, xlRange);


