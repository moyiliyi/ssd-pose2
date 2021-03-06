close all;
classes = {'aeroplane', 
               'bicycle',
               'boat',
               'bus',
               'car',
               'chair',
              'diningtable',
               'motorbike',
              'sofa',
               'train',
              'tvmonitor'};

          
aps = [];
aas = [];


for i=1:length(classes)
    cls = classes{i};
    fname = fullfile(path, [cls '.mat']);
    
    [recall, precision, accuracy, ap, aa] = compute_recall_precision_accuracy_azimuth(cls, bins, bins, fname, rotate, bin_fa);
    %ap = 0;
    %disp(ap)
    %aps = [aps ap];
    aas = [aas aa];
end


fid = fopen(fullfile(path, 'results.txt'), 'w');
%for i=1:length(classes)
%    cls = classes{i};
%    fprintf(fid, sprintf('%s', cls));
%    spaces = 15 - length(cls);
%    for j=1:spaces
%        fprintf(fid, ' ');
%    end
%end
%fprintf(fid, '\n');

%disp(aas(2))
for i=1:length(classes)
%    fprintf(fid, sprintf('%.1f           ', aas(i)*100));
     fprintf(fid, sprintf('%.1f & ', aas(i)*100));
end
fprintf(fid, sprintf('%.1f\n', mean(aas)*100));
%fprintf(fid, '\n');
fprintf(fid, sprintf('%.1f\n', mean(aas)*100));

fclose(fid);

disp(mean(aas)*100);


