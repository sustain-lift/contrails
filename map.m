%%Cooridinate array
T = readtable("worldcities.csv");
cityarr=T.Var1;
cityarr2=T.city_ascii;
countryarr=T.country;

%%Setting coordinates
city1="San Jose";
country1="United States";
city2="Toronto";
country2="Canada";
indc1=1;
indc2=2;
for k = 1:numel(cityarr)
    if (cityarr{k}==city1||cityarr2{k}==city1)&&countryarr{k}==country1
        indc1=k;
    end
end
for k = 1:numel(cityarr)
    if (cityarr{k}==city2||cityarr2{k}==city2)&&countryarr{k}==country2
        indc2=k;
    end
end

latstart=T{indc1,"lat"};
lonstart=T{indc1,"lng"};
latend=T{indc2,"lat"};
lonend=T{indc2,"lng"};

%Calculating the distance
distance=6371*acos(sin(latstart/(180/pi))*sin(latend/(180/pi))+cos(latstart/(180/pi))*cos(latend/(180/pi))*cos(lonstart/(180/pi)-lonend/(180/pi)));
distance=sprintf('%.6f',distance);

%Drawing the map
figure
geoplot([latstart,latend],[lonstart,lonend],'-*')
text((latstart+latend)/2,(lonstart+lonend)/2,"   "+distance+" kilometers");
geobasemap streets
